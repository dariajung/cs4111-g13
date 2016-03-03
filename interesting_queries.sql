-- show all names and party affiliation of politicians who are also senators 
-- and are worth at least $1 million USD
SELECT p.name, p.party_affiliation
FROM senators s, politicians p
WHERE p.net_worth >= 1000000 AND p.name = s.name
GROUP BY p.name, p.party_affiliation;

-- not sure what this is yet
-- SELECT p.name, pacs.committee_id, pacs.name
-- FROM politicians p, pacs, pac_supports ps 
-- WHERE p.party_affiliation = 'Democrat' AND p.name = ps.politician_name AND pacs.committee_id = ps.committee_id
-- GROUP BY p.name, pacs.committee_id, pacs.name, ps.amount
-- HAVING ps.amount > (SELECT AVG(pac_supports.amount) FROM pac_supports)


-- Show the average amount that PACs donate to leadership PACs by party affiliation
SELECT p.party_affiliation, AVG(ps.amount)
FROM politicians p, pacs, pac_supports ps 
WHERE p.name = ps.politician_name AND pacs.committee_id = ps.committee_id
GROUP BY p.party_affiliation;


-- Show average median income of states grouped by their senior senators' party affiliation where percentage minority > 10
SELECT p.party_affiliation, AVG(rep_state.median_income)
FROM politicians p, rep_state
WHERE rep_state.percentage_minorities > 10 AND (p.name = rep_state.sr_senator_name)
GROUP BY p.party_affiliation


-- select all pacs with a budget over $1,000,000 USB who donated to republicans
SELECT pn.name, pc.name, pc.budget
FROM pacs pc, politicians pn  
WHERE pc.budget > 1000000 AND pn.party_affiliation = 'Republican' 
GROUP BY pn.name
