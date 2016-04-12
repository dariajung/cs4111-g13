# cs4111-g13

Databases - Project 1 - Part3

Daria Jung (djj2115) & Sona Roy (sbr2146)


PostgreSQL account
-------------------------------------
djj2115

URL of web application
-------------------------------------
http://extra.eastus.cloudapp.azure.com:8111

Parts of Part1 Proposal Implemented
-------------------------------------
- Built searching application that allows user to view how campaign finance money affects legislation and law.
- user will view receipts of money from large industries to senators and representatives using PACs, and then view how politicians voted on legislation related to those industries (to see if campaign donations affected their vote)
- application allows users to use search criteria such as: politician name, state, cause, legislation, type of organization (Super PAC, PAC), amount of money given, etc 
- added demographic search where user can see the political leanings of politicians based on their represented state's or district's diversity (percentage of population which is minority)

Two Webpages that require most interesting database operations:
-------------------------------------
#####Webpage: http://extra.eastus.cloudapp.azure.com:8111/search_money_from_pacs?query=Harry+Reid
* Use: Shows the PACs which donate directly to a politician (searched by name), and the total amount of money given to a politician from PACs.
* Database Operations:
```SQL  
SELECT new_t.politician_name, new_t.amount, i.committee_id, i.industry_summary, p.name  
FROM (  
	SELECT *  
	FROM pac_supports INNER JOIN pac_donate ON pac_supports.committee_id = pac_donate.to_committee_id  
	WHERE pac_supports.politician_name = %s) as new_t, interested_in i, pacs p  
WHERE i.committee_id = new_t.from_committee_id AND p.committee_id = i.committee_id
```
* Why Interesting: Shows how much money affects a specific politician's campaign - the total donation amount shows how much this politician uses Citizens United, and the loosening of campaign money restrictions to their benefit.

#####Webpage: http://extra.eastus.cloudapp.azure.com:8111/search_voting_bill?query_p=Harry+Reid&query_l=Healthcare
* Use: Shows how a politician votes on bills related to industries.
* Database Operations:
```SQL
SELECT sp.committee_id, ss.amount, p.name, sp.name, sp.viewpoint
FROM super_pacs sp, spac_supports ss, politicians p
WHERE ss.name = p.name AND ss.committee_id = sp.committee_id AND p.name = %s
```
* Why Interesting: Shows how a politician's implementation of actual laws are affected by donations from specific industries.

An Extra Interesting Page:
--------------------------
#####Webpage: http://extra.eastus.cloudapp.azure.com:8111/search_pac_by_summary?query=Defense
* Use: Shows the PACs that are interested in a specific industry and the max cash spent by a PAC in that industry.
* Database Operations:
```SQL
SELECT p.name, p.committee_id, p.budget, p.cash_spent, p.cash_on_hand, p.registrant, i.industry_summary
                            FROM pacs p, interested_in i
                            WHERE i.industry_summary = %s AND p.committee_id = i.committee_id
```

and 

```SQL
SELECT max(p.cash_spent)
FROM interested_in i, pacs p
WHERE p.committee_id = i.committee_id AND i.industry_summary = %s
GROUP BY p.cash_spent
ORDER BY p.cash_spent DESC
```

Where ```%s``` is replaced by an industry summary.

* Why Interesting: We see the power of each industry based on how much money that they are able to donate to politicians.

Extra Implementation Details
-----------------------------
##### Caching

* In order to allow the population of all drop down menus with the data in the database, we populate the information with many SQL queries on the first load of search.html or money_search.html. Then we cache this information in a Python Flask SimpleCache object so that we can get the data without hitting the database everytime we load these two pages. This cached data expires after 300 seconds and is then re-cached.

##### Styling
* We included Twitter's Bootstrap for styling via a CDN. 

