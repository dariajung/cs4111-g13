README

Teammates:
	Daria Jung (djj2115)
	Sona Roy (sbr2146)

PostgreSQL account:
	djj2115

Items Included:
	Explain carefully your rationale behind your modifications to the schema and how these modifications fit within your overall project. 

	1) Composite Type
	We created the composite type "politician_type" because we have a case of inheritance in our SQL schema where we have a table "politicians", from which "senators" and "representatives" inherit their traits. However, our original implementation was inefficient because the full set of attributes for each politician in our database would have to be inserted twice - first into "politicians" and then into either "senators" or "representatives". By creating a composite type we get the same entered politicians in two tables, rather than three, lessen the data in the database by a full 50%, and have fewer check constraints.
	What was created:
	* composite type: type "politician_type"
	* 2 tables of poliitican_type: table "senators1", table "representatives1"

	2) Array Type Attribute
	Each PAC in campaign finance donates to politicians, but often the top few recipients receive thousands of dollars more in donations. We thought that an average user would potentially want to know who each PAC's top recipients of money were. In this case, we limited the number of people in this text array to five, although some PACs had fewer than five recipients. Querying the names in this attribute allows the user to know how politicians rank based on PAC money offerings - including politicians who may not be in our "politicians" table (which is an added benefit to this text array attribute).
	What was created:
	* array type attribute: text[] "top_recipients" in the table "pacs"

	3) Text Type Attribute
	Each piece of legislation in the house has a title, but often that title is not substansive. In order to get more information about a bill, people usually refer to the abstract or introduction, conveniently located at the beginning of each bill listed in congress.gov. These summary paragraphs allow the user to see and understand the purpose of each bill in full detail, as written by the primary sponsors of each piece of legislation. 
	What was created:
	* text type attribute: text "summary" in the table "legislation"

Interesting Queries:
	
	Query1: This query displays the name, party affiliation, and net worth of members in either congressional house who have a net worth of $1 million or more, listed in order of increasing wealth.

	WITH 
		t1 AS (SELECT s.name, s.party_affiliation, s.net_worth
				FROM senators1 s
				WHERE s.net_worth >= 1000000), 
		t2 AS (SELECT r.name, r.party_affiliation, r.net_worth
				FROM representatives1 r
				WHERE r.net_worth >= 1000000)
	SELECT *
	FROM t1 
	UNION 
	SELECT *
	FROM t2
	ORDER BY net_worth;

	Query2: This query finds out which PACs have top recipients donated to either democratic or republican leadership in the house, and lists them in increasing spending power. The Democrats and Republicans are listed in separate arrays as a means of differentiating them (as the search user probably would).

	SELECT p.name as donated_to_leadership, p.budget
	FROM pacs p
	WHERE p.top_recipients && (ARRAY['John Boehner', 'Eric Cantor', 'Kevin McCarthy', 'Steve Scalise'] 
		|| ARRAY['Nancy Pelosi', 'Steny Hoyer', 'Jim Clyburn'])
	ORDER BY p.budget;

	Query3: This query gives the names of all pieces of legislation that have summaries which include either the words 'violence' or 'weapon'. Unfortunately, even though we had 29 summaries in our database, very few pieces of legislation addressed similar issues or had similar phrasing, so single tsqueries worked better than 'word1 & word2', as the latter often limited the output to either 1 or 0 rows. 

	SELECT legislation.name
	FROM legislation
	WHERE to_tsvector('english', summary) @@ (to_tsquery('english', 'violence') 
		|| to_tsquery('english', 'weapon'));

