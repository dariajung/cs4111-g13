-----------------------------------------------------------COMPOSITE TYPE
--setup
CREATE TYPE politician_type AS (
	name varchar(50),
	DOB date,
	net_worth real,
	incumbent_status boolean, 
	party_affiliation varchar(30), 
	years_in_office integer -- check constraint unnecessary b/c of date check below
) 

CREATE TABLE senators1 OF politician_type (
	CHECK (DATE_PART('year', '1983-01-03'::date) - DATE_PART('year', DOB::date) >=0),
	CHECK (net_worth < 370000000),
	PRIMARY KEY (name, DOB)
)

CREATE TABLE representatives1 OF politician_type (
	CHECK (DATE_PART('year', '1988-01-03'::date) - DATE_PART('year', DOB::date) >=0),
	CHECK (net_worth < 110000000),
	PRIMARY KEY (name, DOB)
)

-- querying
-- show all names and party affiliation of senators & representatives who are worth at least $1 million
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

-----------------------------------------------------------ARRAY TYPE ATTRIBUTE
-- setup
ALTER TABLE pacs ADD COLUMN top_recipients text[]

-- querying
-- finding pacs whose top recipients are in leadership of either party of the house
SELECT p.name as donated_to_leadership, p.budget
FROM pacs p
WHERE p.top_recipients && (ARRAY['John Boehner', 'Eric Cantor', 'Kevin McCarthy', 'Steve Scalise'] ||
	ARRAY['Nancy Pelosi', 'Steny Hoyer', 'Jim Clyburn'])
ORDER BY p.budget;


-----------------------------------------------------------TEXT TYPE ATTRIBUTE
-- setup
ALTER TABLE legislation ADD COLUMN summary tsvector
ALTER TABLE legislation 
	ALTER COLUMN summary SET DATA TYPE text

-- querying
-- finding legislation that has a summary which contains the either 'violence' or 'weapon'
SELECT legislation.name
FROM legislation
WHERE to_tsvector('english', summary) @@ (to_tsquery('english', 'violence') 
	|| to_tsquery('english', 'weapon'));

