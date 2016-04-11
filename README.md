# cs4111-g13

Databases - Project 1 - Part3

Daria Jung (djj2115) & Sona Roy (sbr2146)


PostgreSQL account
-------------------------------------
djj2115

URL of web application
-------------------------------------
extra.eastus.cloudapp.azure.com:8111

Parts of Part1 Proposal Implemented
-------------------------------------
- Built searching application that allows user to view how campaign finance money affects legislation and law.
- user will view receipts of money from large industries to senators and representatives using PACs, and then view how politicians voted on legislation related to those industries (to see if campaign donations affected their vote)
- application allows users to use search criteria such as: politician name, state, cause, legislation, type of organization (Super PAC, PAC), amount of money given, etc 
- added demographic search where user can see the political leanings of politicians based on their represented state's or district's diversity (percentage of population which is minority)

Two Webpages that require most interesting database operations:
-------------------------------------
Webpage: http://extra.eastus.cloudapp.azure.com:8111/search_money_from_pacs?query=Harry+Reid
* Use: Shows the PACs which donate directly to a politician (searched by name), and the total amount of money given to a politician from PACs.
* Database Operations:  
SELECT new_t.politician_name, new_t.amount, i.committee_id, i.industry_summary, p.name  
FROM (  
	SELECT *  
	FROM pac_supports INNER JOIN pac_donate ON pac_supports.committee_id = pac_donate.to_committee_id  
	WHERE pac_supports.politician_name = %s) as new_t, interested_in i, pacs p  
WHERE i.committee_id = new_t.from_committee_id AND p.committee_id = i.committee_id
* Why Interesting: Shows how much money affects a specific politician's campaign - the total donation amount shows how much this politician uses Citizens United, and the loosening of campaign money restrictions to their benefit.

Webpage: extra.eastus.cloudapp.azure.com:8111
* Use:
* Database Operations:
* Why Interesting:

Webpage: extra.eastus.cloudapp.azure.com:8111
* Use:
* Database Operations:
* Why Interesting:

