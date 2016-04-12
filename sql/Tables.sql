CREATE TABLE politicians (
	name varchar(50),
	-- also make sure that DOB is within a reasonable time frame b/c we're not doing historical data
	-- oldest birthdate has to be in 1923
	-- must be 100 years old or younger
	DOB date CHECK (DATE_PART('year', '1995-01-01'::date) - DATE_PART('year', DOB::date) >=0 AND DATE_PART('year', '2013-01-03'::date) - DATE_PART('year', DOB::date) <= 100),-- must be 18 to run for office generally
	net_worth real CHECK (net_worth < 400000000), --check net worth < 400 mill
	incumbent_status boolean,
	party_affiliation varchar(30),
	years_in_office integer CHECK (years_in_office <= 82), -- need to years of service
	PRIMARY KEY (name, DOB)
);

-- There is not a way to have a constraint to make sure senators don't appear in
-- representatives, and vise versa with good style.

CREATE TABLE senators (
	name varchar(50),
	DOB date CHECK (DATE_PART('year', '1983-01-03'::date) - DATE_PART('year', DOB::date) >=0), -- must be aged 30 to serve in Senate
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE
);

CREATE TABLE representatives (
	name varchar(50),
	DOB date CHECK (DATE_PART('year', '1988-01-03'::date) - DATE_PART('year', DOB::date) >=0), -- must be aged 25 to serve in HoR
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE
); 

CREATE TABLE rep_state (
	state_name varchar(15),
	population real CHECK (population > 0 AND population < 40000000), --check 0 < population < 40 mill
	major_ethnicity varchar(50),
	median_age real CHECK (median_age > 0 AND median_age < 50), -- check 0 < median_age < 50
	major_party varchar(50),
	median_income real CHECK (median_income > 0 AND median_income < 100000), --check 0 < income < 100,000
	poverty_level real CHECK (poverty_level >= 0 AND poverty_level <= 100),
	sr_senator_name varchar(50) NOT NULL,
	sr_senator_DOB date NOT NULL,
	jr_senator_name varchar(50) NOT NULL,
	jr_senator_DOB date NOT NULL,
	percentage_minorities real CHECK (percentage_minorities >= 0 AND percentage_minorities <= 100),
	FOREIGN KEY (sr_senator_name, sr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	FOREIGN KEY (jr_senator_name, jr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	UNIQUE (sr_senator_name, sr_senator_DOB),
	UNIQUE (jr_senator_name, jr_senator_DOB),
	PRIMARY KEY (state_name)
);

CREATE TABLE rep_district (
	state_name varchar(15),
	district_number integer CHECK (district_number >= 0),
	population real CHECK (population > 0),
	major_ethnicity varchar(50),
	median_age real CHECK (median_age > 0),
	major_party varchar(50),
	median_income real CHECK (median_income > 0),
	poverty_level real CHECK (poverty_level >= 0 AND poverty_level <= 100),
	representative_name varchar(50) NOT NULL,
	representative_DOB date NOT NULL,
	percentage_minorities real CHECK (percentage_minorities >= 0 AND percentage_minorities <= 100),
	FOREIGN KEY(representative_name, representative_DOB) REFERENCES Representatives(name, DOB)
	ON DELETE NO ACTION,
	UNIQUE (representative_name, representative_DOB),
	PRIMARY KEY (state_name, district_number)
);	

-- not every industry advocates for legislation, but each legislation should relate somehow to industries
-- get rid of participation constraint between industries and advocates
CREATE TABLE industries (
	summary varchar(300),
	PRIMARY KEY (summary)
);

CREATE TABLE legislation (
	name varchar(100),
	passed boolean NOT NULL, -- A Legislation must have either passed or failed 
	PRIMARY KEY (name)
);


CREATE TABLE p_sponsors (
	legislation_name varchar(100),
	p_sponsor_name varchar(50),
	p_sponsor_DOB date,
	FOREIGN KEY (p_sponsor_name, p_sponsor_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (legislation_name, p_sponsor_name, p_sponsor_DOB)
);

-- what industry legislation helps
CREATE TABLE advocates (
	name varchar(100), -- name of legislation
	summary varchar(300), -- summary of a cause/industry
	FOREIGN KEY (summary) REFERENCES Industries(summary)
	ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (name, summary)
);

-- removed  participation constraint between PACS and Interested_In: 
-- PACs covers Leadership PACs, which directly support a politician, 
-- and Lobbyist PACs, which are funded by companies and industries in the private sector
CREATE TABLE PACs (
	committee_id char(9),
	name varchar(50),
	budget real CHECK (budget >= 0 AND budget < 20000000),
	cash_spent real CHECK (cash_spent >= 0 AND cash_spent < 20000000),
	cash_on_hand real CHECK (cash_on_hand >= 0 AND cash_on_hand < 20000000),
	registrant boolean,
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

-- Leadership PACs supporting politician
CREATE TABLE PAC_supports (
	committee_id char(11),
	politician_name varchar(50),
	politician_DOB date,
	amount real CHECK (amount >= 0 AND amount < 20000000), -- Attribute constraint >= 0
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, politician_name, politician_DOB)
);

-- Lobbyist PACs donating to Leadership PACs
CREATE TABLE PAC_donate (
	from_committee_id char(9),
	to_committee_id char(9),
	FOREIGN KEY (from_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (to_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (from_committee_id, to_committee_id)
);

-- what industry PACs associate with
CREATE TABLE interested_in (
	committee_id char(9),
	industry_summary varchar(300),
	PRIMARY KEY(committee_id, industry_summary),
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (industry_summary) references Industries(summary) ON DELETE CASCADE
); 


CREATE TABLE super_PACs (
	committee_id char(9),
	name varchar(50),
	viewpoint varchar(30),
	budget real CHECK (budget >= 0 AND budget < 20000000),
	cash_spent real CHECK ((cash_spent <= budget) AND (cash_spent >= 0)),
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

CREATE TABLE SPAC_supports(
	committee_id char(9),
	name varchar(100),
	DOB date,
	amount real CHECK (amount >= 0 AND amount < 20000000),
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB)
);

CREATE TABLE SPAC_against(
	committee_id char(9),
	name varchar(100),
	DOB date,
	amount real CHECK (amount >= 0 AND amount < 20000000),
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB)
);

-- get rid of participation constraint between politician and vote
-- real world constraint - not all  bills get to the floor for a vote, but instead get dropped after being introduced.  
-- representatives might vote, but if the bill is defeated in the House, Senators will never vote on the bill.
Create TABLE Votes(
	politician_name varchar(50),
	politician_DOB DATE,
	legislation_name varchar(100),
	voting_stage varchar (100), -- cloture, house, senate
	voted_for BOOLEAN, -- NULL if abstain from voting
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES legislation(name) ON DELETE CASCADE,
	PRIMARY KEY(politician_name, politician_DOB, legislation_name)
);

--- inserted up to here ---
 
