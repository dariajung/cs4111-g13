-- show all names and party affiliation of politicians who are also senators 
-- and are worth at least $1 million USD
SELECT p.name, p.party_affiliation, p.net_worth
FROM senators s, politicians p
WHERE p.net_worth >= 1000000 AND p.name = s.name

-- not sure what this is yet
-- SELECT p.name, pacs.committee_id, pacs.name
-- FROM politicians p, pacs, pac_supports ps 
-- WHERE p.party_affiliation = 'Democrat' AND p.name = ps.politician_name AND pacs.committee_id = ps.committee_id
-- GROUP BY p.name, pacs.committee_id, pacs.name, ps.amount
-- HAVING ps.amount > (SELECT AVG(pac_supports.amount) FROM pac_supports)

-- Show the average amount that PACs donate to leadership PACs (PACs that support politicians) by party affiliation
SELECT p.party_affiliation, AVG(ps.amount)
FROM politicians p, pacs, pac_supports ps 
WHERE p.name = ps.politician_name AND pacs.committee_id = ps.committee_id
GROUP BY p.party_affiliation;


-- Show average median income of states where percentage minority > 10 grouped by their senior senators' party affiliation 
SELECT p.party_affiliation, AVG(rep_state.median_income)
FROM politicians p, rep_state
WHERE rep_state.percentage_minorities > 10 AND (p.name = rep_state.sr_senator_name)
GROUP BY p.party_affiliation

-- return committee_id of PAC and their industry that have donated over $1,000,000 USD to a PAC that supports a politician
SELECT i.committee_id, i.industry_summary
FROM (SELECT *
FROM pac_supports INNER JOIN pac_donate ON pac_supports.committee_id = pac_donate.to_committee_id
WHERE pac_supports.amount > 1000000) as new_t, interested_in i
WHERE i.committee_id = new_t.from_committee_id

-- select all pacs with a budget over $1,000,000 USD who donated to republicans
SELECT pn.name, pc.name, pc.budget
FROM pacs pc, politicians pn  
WHERE pc.budget > 1000000 AND pn.party_affiliation = 'Republican' 
GROUP BY pn.name


SELECT new_t.politician_name, i.committee_id, i.industry_summary, p.name
FROM (SELECT *
FROM pac_supports INNER JOIN pac_donate ON pac_supports.committee_id = pac_donate.to_committee_id
WHERE pac_supports.politician_name = 'Mitch McConnell') as new_t, interested_in i, pacs p
WHERE i.committee_id = new_t.from_committee_id AND p.committee_id = i.committee_id


SELECT DISTINCT on (l.name) l.name, l.passed, v.voted_for
FROM votes v, politicians p, legislation l, advocates a
WHERE p.name = 'Bernie Sanders' AND a.summary = 'Anti-gun' AND v.politician_name = p.name AND a.name = l.name



-- Add search form for seeing how politicians voted on legislation 
-- that was in the same industry as their donation pacs (input: politician name)
SELECT DISTINCT on (i.industry_summary) i.industry_summary, l.name
FROM pac_supports ps, pac_donate pd, interested_in i, pacs p, legislation l, advocates a
WHERE ps.politician_name = 'Mitch McConnell' AND pd.to_committee_id = ps.committee_id AND i.committee_id = pd.from_committee_id AND p.committee_id = pd.from_committee_id AND a.summary = i.industry_summary AND a.name = l.name


SELECT *
FROM super_pacs sp, spac_supports ss, politicians p
WHERE ss.name = p.name AND ss.committee_id = sp.committee_id AND p.name = 'Mitch McConnell'


--------Search forms for Industry and Demographics


--INDUSTRY Queries

--Find the industry summary, primary sponsor's name and party affiliation 
--of each piece legislation with all information
--(can match to a specific query by using a specific politician name/industry):
SELECT i.summary, ps.p_sponsor_name, p.party_affiliation
FROM industries i, advocates a, p_sponsors ps, politicians p
WHERE i.summary = a.summary AND a.name = ps.legislation_name AND ps.p_sponsor_name = p.name

--Gives the max cash_spent per industry which has a related PAC:
SELECT DISTINCT ON (foo.industry_summary) foo.industry_summary, foo.cash_spent
FROM (
SELECT p.name, i.industry_summary, p.cash_spent
FROM interested_in i, pacs p
WHERE i.committee_id = p.committee_id ) as foo
ORDER BY foo.industry_summary, cash_spent DESC



--DEMOGRAPHICS Queries

--STATES
--Investigate what states are associated with what parties, given increasing minority voters:
--gives ALL states listed
SELECT s.state_name, s.major_party, s.population, s.poverty_level, s.percentage_minorities
FROM rep_state s
ORDER BY s.percentage_minorities

--gives state linked to single senator given by user
SELECT s.state_name, s.major_party, s.population, s.poverty_level, s.percentage_minorities
FROM rep_state s
WHERE s.sr_senator_name = 'Bernie Sanders' OR s.jr_senator_name = 'Bernie Sanders'

--gives single state requested by user
SELECT s.state_name, s.major_party, s.population, s.poverty_level, s.percentage_minorities
FROM rep_state s
WHERE s.state = 'New York'

--DISTRICTS
--Investigate what districts are associated with what parties, given increasing minority voters:
--gives ALL districts listed
SELECT d.state_name, d.district_number, d.major_party, d.population, d.poverty_level, d.percentage_minorities
FROM rep_district d
ORDER BY d.percentage_minorities

--gives state linked to single representative given by user
SELECT d.state_name, d.district_number, d.major_party, d.population, d.poverty_level, d.percentage_minorities
FROM rep_district d
WHERE d.representative_name = 'Nancy Pelosi'

--gives single district requested by user
SELECT d.state_name, d.district_number, d.major_party, d.population, d.poverty_level, d.percentage_minorities
FROM rep_district d
WHERE d.state_name = 'California' AND d.district_number = '12'



