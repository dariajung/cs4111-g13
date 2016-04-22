-----------------------------------------------------------TRIGGER/COMPOSITE TYPE
-- trigger = could replace all the check attributes with single trigger
-- create triggers for all the check constraints below, for an entire set of tables
-- deleted this = went to office hours and got told that seems redundant...


-- composite type = could create senators and representatives as politicians type (would have to change/drop tables)
-- deletes a table & makes check constraints personal
CREATE TYPE politician_type AS (name varchar(50), DOB date, net_worth real, incumbent_status boolean, party_affiliation varchar(30), years_in_office integer) 

CREATE TABLE senators1 OF politician_type (
	DOB date CHECK (DATE_PART('year', '1983-01-03'::date) - DATE_PART('year', DOB::date) >=0)
	PRIMARY_KEY (name, DOB)
)

CREATE TABLE representatives1 OF politician_type (
	DOB date CHECK (DATE_PART('year', '1988-01-03'::date) - DATE_PART('year', DOB::date) >=0)
	PRIMARY_KEY (name, DOB)
)

-----------------------------------------------------------ARRAY TYPE ATTRIBUTE
ALTER TABLE pacs ADD COLUMN top_recipients text[]
ALTER TABLE pacs ADD COLUMN quarterly_money integer[]

ALTER TABLE pacs DROP COLUMN top_recipients 

-- adding 10 tuples of data
-- goldman sachs
UPDATE pacs
	SET top_recipients = ARRAY['John Boehner', 'Ed Royce', 'Jeb Hensarling', 'Kevin McCarthy', 'Steve Scalise']

	WHERE committee_id = 'C00350744'

--pepsico
UPDATE pacs
	SET top_recipients = ARRAY['John Boehner', 'Rodney Davis', 'Lynn Jenkins', 'Sean Maloney', 'Patrick Scott']
	WHERE committee_id = 'C00039321'

-- american petroleum institute
UPDATE pacs
	SET top_recipients = ARRAY['Kevin McCarthy', 'Fred Upton', 'Tom Reed', 'John Barrow', 'John Boehner']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

UPDATE pacs
	SET top_recipients = ARRAY['', '', '', '', '']
	WHERE committee_id = 

-- querying
-- finding pacs which have overlapping top recipients
SELECT pacs.name
FROM pacs
WHERE 

-----------------------------------------------------------TEXT TYPE ATTRIBUTE
-- needed to do once
ALTER TABLE legislation ADD COLUMN summary tsvector

ALTER TABLE legislation 
	ALTER COLUMN summary SET DATA TYPE text

-- adding 10 tuples of data
-- note: any quotation marks within the text need to be doubly normalized to '' for them to be interpreted correctly
UPDATE legislation
	SET summary = 'Clean and Fair Elections Act - Expresses the sense of the Senate with respect to congressional attention to elections and voting, including concerning: structuring election administration and campaign finance systems so that the interests of the American public are the first priority; greater transparency and an end to anonymous political spending by shadow groups and special interests; disclosure of campaign contributions in a searchable, public online database, safeguarding the right to vote, including by prohibiting deceptive and misleading efforts to prevent voters from exercising the franchise; streamlining voting procedures; passage of legislation that includes expanded absentee voting, mandatory early voting periods, and voter registration reforms; ensuring that local election officials have working voting systems that are accessible, secure, and easy to use; state plans to reduce lines at polling places and provide additional flexibility in the event of a natural disaster or other emergency; and enforcement of the guarantees of the Fourteenth and Fifteenth Amendments to the Constitution and the Voting Rights Act of 1965 so that all Americans are able to vote and have their votes count without discrimination.'
	WHERE name = 'S.9 - Clean And Fair Elections Act'

UPDATE legislation
	SET summary = 'Sandy Hook Elementary School Violence Reduction Act - Expresses the sense of the Senate with respect to congressional attention to gun violence, including concerning: support for efforts of the President; promotion of common sense proposals for preventing gun violence; assistance to law enforcement officers for combating violent crime, protecting communities, and protecting themselves; safe and successful learning conditions for children attending school; tools for identifying individuals who pose a threat to themselves or others; keeping dangerous weapons out of the hands of criminals and individuals not lawfully authorized to possess them; information-sharing to facilitate early identification of threats to public safety; promoting preparedness; training for educational professionals, health providers, and others to recognize indicators of the potential for violent behavior; the connection between violent media and violent behavior; the collection, study, and publication of relevant research; and access to mental health services, with a focus on children and young adults.'
	WHERE name = 'S.2 - Sandy Hook Elementary School Violence Reduction Act'

UPDATE legislation
	SET summary = 'Default Prevention Act of 2013 - Amends the No Budget, No Pay Act of 2013 (P.L. 113-3) to suspend the public debt limit through December 31, 2014. Revises the special rule relating to obligations issued during the suspension period to provide for an increase in the debt limit, effective January 1, 2015, to the extent that: (1) the face amount of obligations issued and the face amount of obligations whose principal and interest are guaranteed by the federal government (except guaranteed obligations held by the Secretary of the Treasury) outstanding on January 1, 2015, exceeds (2) the face amount of such obligations outstanding on the date of enactment of this Act. Prohibits an obligation from being taken into account unless its issuance was necessary to fund a commitment incurred by the federal government that required payment before January 1, 2015.'
	WHERE name = 'S. 1569 - Default Prevention Act of 2013'

UPDATE legislation
	SET summary = 'Immigration Enforcement Transparency Act - Requires a law enforcement official enforcing an immigration law to collect specified data, including: (1) the basis for such enforcement action; (2) the individual''s identifying characteristics, including race, gender, ethnicity, and age; (3) how long a stop or search lasted and whether consent was obtained; (4) a description of any items seized; (5) whether an arrest or detention was made, the justification for such arrest or detention, and the ultimate disposition of such arrest or detention; (6) the individual''s immigration status and whether removal proceedings were subsequently initiated against that individual; and (7) whether the individual filed a complaint. Requires the Secretary of Homeland Security (DHS) to compile such data and submit a related report to Congress annually.'
	WHERE name = 'S. 260 - Immigration Enforcement Transparency Act'

UPDATE legislation
	SET summary = 'Veteran Voting Support Act - Directs the Secretary of Veterans Affairs to provide mail voter registration application forms to each veteran who: (1) seeks to enroll in the Department of Veterans Affairs (VA) health care system at the time of such enrollment, and (2) is already enrolled in such system when there is a change in the veteran''s enrollment status or when there is a change in the veteran''s address. Requires the Secretary to accept completed application forms for transmittal to appropriate state election officials. Instructs that forms accepted at VA medical centers, community living centers, community-based outpatient centers, and domiciliaries be transmitted within ten days of acceptance, unless a completed form is accepted within five days before the last day for registration to vote in an election, in which case the application shall be transmitted to the appropriate state election official within five days of acceptance. Prohibits any information relating to registering to vote, or to a declination to register to vote, under this Act from being used for any purpose other than voter registration. Requires each Director of a VA community living center, domiciliary, or medical center to provide assistance in voting by absentee ballot to resident veterans. Requires such assistance to include: (1) providing information relating to the opportunity to request an absentee ballot; (2) making available absentee ballot applications upon request, as well as assisting in completing such applications and ballots; and (3) working with local election administration officials to ensure the proper transmission of the applications and ballots. Directs the Secretary to permit nonpartisan organizations to provide voter registration information and assistance at facilities of the VA health care system. Prohibits the Secretary from banning any election administration official, whether state or local, party-affiliated or non-party affiliated, or elected or appointed, from providing voting information to veterans at any VA facility. Directs the Secretary to provide reasonable access to facilities of the VA health care system to state and local election officials for the purpose of providing nonpartisan voter registration services to individuals.'
	WHERE name = 'S. 2145 - Veteran Voting Support Act'

UPDATE legislation
	SET summary = 'Violence Against Women Reauthorization Act of 2013 - (Sec. 3) Amends the Violence Against Women Act of 1994 (VAWA) to add or expand definitions of several terms used in such Act, including : (1) "culturally specific services" to mean community-based services that offer culturally relevant and linguistically specific services and resources to culturally specific communities; (2) "personally identifying information or personal information" with respect to a victim of domestic violence, dating violence, sexual assault, or stalking; (3) "underserved populations" as populations that face barriers in accessing and using victim services because of geographic location, religion, sexual orientation or gender identity; and (4) "youth" to mean a person who is 11 to 24 years old. Modifies or expands grant conditions under such Act, including requirements relating to: (1) nondisclosure of personally identifying information or other client information, (2) information sharing between grantees and subgrantees, (3) civil rights and nondiscrimination, (4) audit requirements for grants, and (5) nonprofit organizations. Requires the Office on Violence Against Women of the Department of Justice (DOJ) to establish a biennial conferral process with state and tribal coalitions, technical assistance providers, and other key stakeholders on the administration of grants and related matters.'
	WHERE name = 'S. 47 - Violence Against Women Reauthorization Act of 2013'

UPDATE legislation
	SET summary = 'Homeowner Flood Insurance Affordability Act of 2013 - Prohibits the Administrator of the Federal Emergency Management Agency (FEMA) from implementing a requirement of the National Flood Insurance Act of 1968 (NFIA) that would: (1) increase flood insurance risk premium rates to reflect the current risk of flood for certain property located in specified areas subject to a specified mandatory premium adjustment, or (2) reduce statutory subsidies for any property not insured by the National Flood Insurance Program (NFIP) as of July 6, 2012, or any policy that has lapsed in coverage as a result of the policyholder''s deliberate choice (pre-Flood Insurance Rate Map or pre-FIRM properties). Sets an expiration date for such prohibitions six months after one or another of three specified alternative events takes place.'
	WHERE name = 'S. 1846 - Homeowner Flood Insurance Affordability Act of 2013'

UPDATE legislation
	SET summary = 'Venezuela Defense of Human Rights and Civil Society Act of 2014 - (Sec. 3) Expresses the sense of Congress that: the United States aspires to a mutually beneficial relationship with Venezuela based on respect for human rights and the rule of law, and a productive relationship on issues of public security, including counter narcotics and counterterrorism; the United States supports the efforts of the people of Venezuela to realize their economic potential and advance representative democracy; the government of Venezuela''s mismanagement of its economy has produced conditions of economic hardship; the government''s failure to guarantee public security has led Venezuela to become one of the most violent countries in the world; the government continues to remove checks and balances on the executive, politicize the judiciary, undermine the independence of the legislature, persecute its political opponents, curtail freedom of the press, and limit the free expression of its citizens; the people of Venezuela have turned out in demonstrations throughout the country to protest the government''s inability to ensure their political and economic well-being; and the use of violence by the National Guard and security personnel is intolerable and the use of unprovoked violence by protesters is also a matter of serious concern.'
	WHERE name = 'S. 2142 - Venezuela Defense of Human Rights and Civil Society Act of 2014'

UPDATE legislation
	SET summary = 'Unlocking Consumer Choice and Wireless Competition Act - Repeals a Library of Congress (LOC) rulemaking determination, made upon the recommendation of the Register of Copyrights, regarding the circumvention of technological measures controlling access to copyrighted software on wireless telephone handsets (mobile telephones) for the purpose of connecting to different wireless telecommunications networks (a practice commonly referred to as "unlocking" such devices). Reestablishes, as an exemption to provisions of the Digital Millennium Copyright Act (DMCA) prohibiting such circumvention, a previous LOC rule permitting the use of computer programs, in the form of firmware or software, that enable used wireless telephone handsets to connect to a wireless telecommunications network, when circumvention is initiated by the owner of the copy of such computer program solely to connect to such a network and access to the network is authorized by the network operator, thus permitting unlocked phones. Directs the Librarian of Congress, upon the recommendation of the Register, to determine whether to extend such exemption to include any other category of wireless devices in addition to wireless telephone handsets (e.g., tablets and other mobile broadband-enabled devices). Allows such circumvention (unlocking) to be initiated by the owner of such a device, by another person at the direction of the owner, or by a provider of a commercial mobile radio service or a commercial mobile data service at the direction of such owner or other person, solely in order to enable such owner or a family member of such owner to connect to a wireless telecommunications network, when such connection is authorized by the operator of such network. Prohibits this Act from being construed to alter any party''s rights under existing law.'
	WHERE name = 'S. 517 - Unlocking Consumer Choice and Wireless Competition Act'

UPDATE legislation
	SET summary = 'Hydropower Regulatory Efficiency Act of 2013 - (Sec. 3) Amends the Public Utility Regulatory Policies Act of 1978 (PURPA) to increase from 5,000 to 10,000 kilowatts the size of small hydroelectric power projects which the Federal Energy Regulatory Commission (FERC) may exempt from its license requirements. (Sec. 4) Amends the Federal Power Act to revise the limitation on the maximum installation capacity of qualifying conduit hydropower facilities that are eligible for an exemption from licensing requirements. Requires any person, state, or municipality proposing to construct a qualifying conduit hydropower facility to file with FERC a notice of intent to do so. Requires FERC, within 15 days after receiving such a notice of intent, to make an initial determination as to whether the facility meets the qualifying criteria. Waives license requirements for any conduit hydroelectric facility that: (1) uses for electric power generation only the hydroelectric potential of a non-federally owned conduit, (2) has a maximum installed capacity of 5 megawatts, and (3) is not currently licensed or exempted from license requirements. Redefines "conduit" to specify any tunnel, canal, pipeline, aqueduct, flume, ditch, or similar manmade water conveyance operated for the distribution of water for agricultural, municipal, or industrial consumption and not primarily for the generation of electricity. Authorizes FERC to: (1) exempt from license requirements any electric power generation facility that utilizes for such generation only the hydroelectric potential of a conduit, and has an installed capacity or 40 megawatts or fewer; and (2) extend the preliminary permit period for up to 2 additional years beyond the 3 years otherwise allowed if it finds that the permittee has implemented activities under the permit in good faith and with reasonable diligence.'
	WHERE name = 'H.R. 267 - Hydropower Regulatory Efficiency Act of 2013'

UPDATE legislation
	SET summary = 'ObamaCare Repeal Act - Repeals the Patient Protection and Affordable Care Act and the Health Care and Education Reconciliation Act of 2010, effective as of their enactment. Restores provisions of law amended by such Acts.'
	WHERE name = 'S. 177 - ObamaCare Repeal Act'

UPDATE legislation
	SET summary = 'SuperPAC Elimination Act of 2014 - Amends the Federal Election Campaign Act of 1971 to: (1) eliminate the limitations on direct contributions to candidates in federal elections, and (2) require 24-hour notification to the Secretary of the Senate, or the Federal Election Commission, and the Secretary of State, as appropriate, for all direct contributions to candidates in excess of $200.'
	WHERE name = 'S. 2415 - SuperPAC Elimination Act of 2014'

UPDATE legislation
	SET summary = 'Equal Employment for All Act of 2013 - Amends the Fair Credit Reporting Act to prohibit a current or prospective employer from using a consumer report or an investigative consumer report, or from causing one to be procured, for either employment purposes or for making an adverse action, if the report contains information that bears upon the consumer''s creditworthiness, credit standing, or credit capacity. Makes exceptions to such prohibition when: (1) the consumer applies for, or currently holds, employment that requires a national security clearance; or (2) a consumer report is otherwise required by law.'
	WHERE name = 'S. 1837 -  Equal Employment for All Act of 2013'

UPDATE legislation
	SET summary = 'Palestinian and United Nations Anti-Terrorism Act of 2014 - States that it shall be U.S. policy to: (1) deny U.S. assistance to any entity or international organization that collaborates with Hamas until Hamas agrees to recognize Israel, renounces violence, disarms, and accepts prior Israeli-Palestinian agreements; (2) seek a negotiated settlement only if Hamas and any U.S.-designated terrorist groups are required to disarm entirely; and (3) provide security assistance to Israel. Considers any power-sharing government, including the current government, formed in connection with the April 23, 2014, agreement between the Palestinian Liberation Organization (PLO) and Hamas to be a "Hamas-controlled Palestinian Authority (PA)" and thus subject to specified restrictions under the Foreign Assistance Act of 1961. States that until the Secretary of State certifies to Congress that the United Nations Human Rights Council (UNHRC)''s agenda does not include a permanent item related to Israel or the Palestinian territories: (1) the U.S. contribution to the regular budget of the United Nations (U.N.) shall be reduced by a specified amount, (2) the Secretary shall not make a voluntary contribution to UNHRC, and (3) the United States shall not run for an UNHRC seat.'
	WHERE name = 'S. 2766 - Palestinian and United Nations Anti-Terrorism Act of 2014'

UPDATE legislation
	SET summary = 'Medicaid Generic Drug Price Fairness Act - Amends title XIX (Medicaid) of the Social Security Act to extend to manufacturers of generic drugs the requirement that drug manufacturers in certain circumstances pay an additional rebate to state Medicaid programs.'
	WHERE name = 'S. 2948 - Medicaid Generic Drug Price Fairness Act'

UPDATE legislation
	SET summary = 'Employ Young Americans Now Act - Establishes in the Treasury the Employ Young Americans Fund, with an initial appropriation of $5.5 billion for FY2015. Requires the Secretary of Labor to make certain Fund allocations to each state with an approved workforce investment system plan modification, other specified requests for funds, and Native American program grantees to provide summer and year-round employment opportunities to low-income youth. Requires the Secretary to award allocations and competitive grants to local entities for work-based training and other work-related and educational strategies and activities of demonstrated effectiveness to provide unemployed, low-income young adults and low-income youths with skills that will lead to employment. Subjects activities funded under this Act to federal labor standards and nondiscrimination protections.'
	WHERE name = 'S. 2832 - Employ Young Americans Now Act'

UPDATE legislation
	SET summary = 'Phone Scam Prevention Act of 2014 - Amends the Communications Act of 1934 to require voice communications service providers to offer subscribers the option to designate a list of approved telephone numbers for which calls originating from those numbers are permitted to connect directly with the subscriber''s telephone and other customer premises equipment. Requires providers to ensure that any call for termination that is not from a number on the subscriber''s list is processed according to the subscriber''s preferences, including by limiting or disabling the ability of an incoming call to connect with the subscriber''s equipment. Exempts government and public interest calls from being subject to a subscriber''s preferences. Requires the Federal Communications Commission (FCC) to develop authentication standards for providers to validate caller information so that subscribers may obtain secure assurances of a call''s origin, including the calling party''s number and identification. Extends the prohibition on the provision of inaccurate caller identification information to persons outside the United States if the recipient is within the United States. Expands the definition "caller identification information" to include text messages. Revises caller identification requirements to make standards applicable to voice communications using resources from the North American Numbering Plan (currently, the requirements apply to telecommunications or IP-enabled voice services).' 
	WHERE name = 'S.  2956 - Phone Scam Prevention Act of 2014'

UPDATE legislation
	SET summary = 'United States-Israel Strategic Partnership Act of 2014 - (Sec. 4) Expresses the sense of Congress that Israel is a major U.S. strategic partner. (Sec. 5) Amends the Department of Defense Appropriations Act, 2005 to extend authority to transfer certain obsolete or surplus Department of Defense (DOD) items to Israel. Amends the Foreign Assistance Act of 1961 to extend authority to make additions to foreign-based defense stockpiles for use as war reserve stocks through FY2015. (Sec. 6) Directs the President to take steps to make Israel eligible for the strategic trade authorization exception to the requirement for a license for the export, reexport, or in-country transfer of an item subject to certain export controls. (Sec. 7) Authorizes the President to carry out U.S.-Israel cooperative activities and to provide assistance for cooperation in the fields of energy, water, agriculture, and alternative fuel technologies. Authorizes the President to: (1) share and exchange with Israel research, technology, intelligence, information, equipment, and personnel that will advance U.S. national security interests; and (2) enhance U.S.-Israel scientific cooperation. Authorizes the Secretary of Homeland Security (DHS) to enter into cooperative research pilot programs with Israel to enhance Israel''s capabilities in: (1) border, maritime, and aviation security; (2) explosives detection; and (3) emergency services. (Sec. 8) Directs the President to report to Congress regarding the feasibility and advisability of expanding U.S.-Israel cyber cooperation. (Sec. 9) States that it shall be U.S. policy to include Israel in the visa waiver program when Israel satisfies, and as long as Israel continues to satisfy, program requirements. (Sec. 10) Directs the President to update Congress on efforts taken, pursuant to the United States-Israel Enhanced Security Cooperation Act, to provide Israel with defense articles and defense services, including missile and joint missile defense capabilities including Iron Dome, security and intelligence cooperation, and an expanded role for Israel with the North Atlantic Treaty Organization (NATO).'
	WHERE name = 'S. 2673 - United States-Israel Strategic Partnership Act of 2014'

UPDATE legislation
	SET summary = 'Simplifying Financial Aid for Students Act of 2014 - Amends title IV (Student Assistance) of the Higher Education Act of 1965 to require the Secretary of Education to provide for the use of data from the second preceding tax year when and to the extent necessary to carry out the simplification of applications used in estimating and determining financial aid eligibility. Requires such simplification to include data sharing between the Internal Revenue Service (IRS) and the Department of Education, pursuant to taxpayer consent. Increases (from $23,000 to $30,000) the limit on the adjusted gross income that parents, in the case of dependent students, and students and their spouses, in the case of independent students with dependents other than a spouse, may make if those students are to be considered as having zero expected family contribution in the determination of their need for financial aid.'
	WHERE name = 'S. 2340 - Simplifying Financial Aid for Students Act of 2014'

UPDATE legislation
	SET summary = 'Obamacare Opt-Out Act of 2014 - Exempts from the minimum essential coverage requirements under the Patient Protection and Affordable Care Act individuals who request an exemption through a health care marketplace or on their federal income tax return.'
	WHERE name = 'S. 2733 - ObamaCare Opt Out Act of 2014'

UPDATE legislation
	SET summary = 'Assault Weapons Ban of 2013 - (Sec. 3) Amends the federal criminal code to ban the import, sale, manufacture, transfer, or possession of a semiautomatic assault weapon, including: a semiautomatic rifle that can accept a detachable magazine and has any one of the following characteristics: (1) a pistol grip; (2) a forward grip; (3) a folding, telescoping, or detachable stock; (4) a grenade or rocket launcher; (5) a barrel shroud; or (6) a threaded barrel; a semiautomatic rifle or pistol with a fixed magazine that can accept more than 10 rounds; a semiautomatic pistol that can accept a detachable magazine and has any one of the following characteristics: (1) a threaded barrel, (2) a second pistol grip, (3) a barrel shroud, (4) the capacity to accept a detachable magazine at some location outside of the pistol grip, or (5) a semiautomatic version of an automatic firearm; a semiautomatic shotgun that has any one of the following characteristics: (1) a folding, telescoping, or detachable stock; (2) a pistol grip; (3) a fixed magazine that can accept more than five rounds; (4) the ability to accept a detachable magazine; (5) a forward grip; or (6) a grenade or rocket launcher; a shotgun with a revolving cylinder; firearms that are specifically listed as prohibited by this Act and copies, duplicates, variants, or altered facsimiles with the capability of any such weapon; all belt-fed semiautomatic firearms; any combination of parts from which any such prohibited firearm can be assembled; and the frame or receiver of a prohibited rifle or shotgun.'
	WHERE name = 'S. 150 - Assault Weapons Ban of 2013'

DELETE FROM legislation
	wHERE name = 'S.Res. 28 - A resolution to provide sufficient time for legislation to be read.'

-- note: the remaining 12 summaries will respond to every tsquery because their values are empty

-- querying
SELECT legislation.name
FROM legislation
WHERE to_tsvector('english', summary) @@ to_tsquery('english', 'israel')