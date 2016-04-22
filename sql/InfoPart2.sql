
-- text type attribute
-- need to do once
ALTER TABLE legislation ADD COLUMN summary tsvector;

ALTER TABLE legislation 
	ALTER COLUMN summary SET DATA TYPE text

-- adding 10 tuples of data
UPDATE legislation
	SET summary = 'Clean and Fair Elections Act - Expresses the sense of the Senate with respect to congressional attention to elections and voting, including concerning: structuring election administration and campaign finance systems so that the interests of the American public are the first priority; greater transparency and an end to anonymous political spending by shadow groups and special interests; disclosure of campaign contributions in a searchable, public online database, safeguarding the right to vote, including by prohibiting deceptive and misleading efforts to prevent voters from exercising the franchise; streamlining voting procedures; passage of legislation that includes expanded absentee voting, mandatory early voting periods, and voter registration reforms; ensuring that local election officials have working voting systems that are accessible, secure, and easy to use; state plans to reduce lines at polling places and provide additional flexibility in the event of a natural disaster or other emergency; and enforcement of the guarantees of the Fourteenth and Fifteenth Amendments to the Constitution and the Voting Rights Act of 1965 so that all Americans are able to vote and have their votes count without discrimination.'
	WHERE name = 'S.9 - Clean And Fair Elections Act'

UPDATE legislation
	SET summary = 'Sandy Hook Elementary School Violence Reduction Act - Expresses the sense of the Senate with respect to congressional attention to gun violence, including concerning: support for efforts of the President; promotion of common sense proposals for preventing gun violence; assistance to law enforcement officers for combating violent crime, protecting communities, and protecting themselves; safe and successful learning conditions for children attending school; tools for identifying individuals who pose a threat to themselves or others; keeping dangerous weapons out of the hands of criminals and individuals not lawfully authorized to possess them; information-sharing to facilitate early identification of threats to public safety; promoting preparedness; training for educational professionals, health providers, and others to recognize indicators of the potential for violent behavior; the connection between violent media and violent behavior; the collection, study, and publication of relevant research; and access to mental health services, with a focus on children and young adults.'
	WHERE name = 'S.2 - Sandy Hook Elementary School Violence Reduction Act'

UPDATE legislation
	SET summary = 'Default Prevention Act of 2013 - Amends the No Budget, No Pay Act of 2013 (P.L. 113-3) to suspend the public debt limit through December 31, 2014. Revises the special rule relating to obligations issued during the suspension period to provide for an increase in the debt limit, effective January 1, 2015, to the extent that: (1) the face amount of obligations issued and the face amount of obligations whose principal and interest are guaranteed by the federal government (except guaranteed obligations held by the Secretary of the Treasury) outstanding on January 1, 2015, exceeds (2) the face amount of such obligations outstanding on the date of enactment of this Act. Prohibits an obligation from being taken into account unless its issuance was necessary to fund a commitment incurred by the federal government that required payment before January 1, 2015.'
	WHERE name = 'S. 1569 - Default Prevention Act of 2013'

-- note: any quotation marks within the text need to be doubly normalized to '' for them to be interpreted correctly
UPDATE legislation
	SET summary = 'Immigration Enforcement Transparency Act - Requires a law enforcement official enforcing an immigration law to collect specified data, including: (1) the basis for such enforcement action; (2) the individual''s identifying characteristics, including race, gender, ethnicity, and age; (3) how long a stop or search lasted and whether consent was obtained; (4) a description of any items seized; (5) whether an arrest or detention was made, the justification for such arrest or detention, and the ultimate disposition of such arrest or detention; (6) the individual''s immigration status and whether removal proceedings were subsequently initiated against that individual; and (7) whether the individual filed a complaint. Requires the Secretary of Homeland Security (DHS) to compile such data and submit a related report to Congress annually.'
	WHERE name = 'S. 260 - Immigration Enforcement Transparency Act'

UPDATE legislation
	SET summary = ''
	WHERE name = ''

UPDATE legislation
	SET summary = ''
	WHERE name = ''

-- querying
SELECT legislation.name
FROM legislation
WHERE to_tsvector('english', summary) @@ to_tsquery('english', 'friend')