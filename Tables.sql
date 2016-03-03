CREATE TABLE politicians (
	name varchar(50),
	DOB date CHECK (DATE_PART('year', '1995-01-01'::date) - DATE_PART('year', DOB::date) >=0),-- must be 18 to run for office generally
	net_worth real,
	incumbent_status boolean,
	party_affiliation varchar(30),
	years_in_office integer,
	PRIMARY KEY (name, DOB)
);

-- is there a way to have a constraint on making sure senators don't appear in
-- representatives, and vise versa?
-- there's no way to do this with good style

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
	population real CHECK (population >= 0),
	major_ethnicity varchar(50),
	median_age real CHECK (median_age >= 0),
	major_party varchar(50),
	median_income real CHECK (median_income >= 0),
	poverty_level real CHECK (poverty_level >= 0),
	sr_senator_name varchar(50) NOT NULL,
	sr_senator_DOB date NOT NULL,
	jr_senator_name varchar(50) NOT NULL,
	jr_senator_DOB date NOT NULL,
	percentage_minorities real CHECK (percentage_minorities >= 0),
	FOREIGN KEY (sr_senator_name, sr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	FOREIGN KEY (jr_senator_name, jr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	UNIQUE (sr_senator_name, sr_senator_DOB),
	UNIQUE (jr_senator_name, jr_senator_DOB),
	PRIMARY KEY (state_name)
);

CREATE TABLE rep_district (
	state_name varchar(15),
	district_number integer CHECK (district_number >= 0),
	population real CHECK (population >= 0),
	major_ethnicity varchar(50),
	median_age real CHECK (median_age >= 0),
	major_party varchar(50),
	median_income real CHECK (median_income >= 0),
	poverty_level real CHECK (poverty_level >= 0),
	representative_name varchar(50) NOT NULL,
	representative_DOB date NOT NULL,
	percentage_minorities real CHECK (percentage_minorities >= 0),
	FOREIGN KEY(representative_name, representative_DOB) REFERENCES Representatives(name, DOB)
	ON DELETE NO ACTION,
	UNIQUE (representative_name, representative_DOB),
	PRIMARY KEY (state_name, district_number)
);	

-- Not every industry advocates for legislation, but each legislation should relate somehow to industries
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

-- Removed  participation constraint between PACS and Interested_In: 
-- PACs covers Leadership PACs, which directly support a politician, 
-- and Lobbyist PACs, which are funded by companies and industries in the private sector
CREATE TABLE PACs (
	committee_id char(9),
	name varchar(50),
	budget real CHECK (budget >= 0),
	cash_spent real CHECK (cash_spent >= 0),
	cash_on_hand real CHECK (cash_on_hand >= 0),
	registrant boolean,
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

CREATE TABLE PAC_supports (
	committee_id char(11),
	politician_name varchar(50),
	politician_DOB date,
	amount real CHECK (amount >= 0), -- Attribute constraint >= 0
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, politician_name, politician_DOB)
);

CREATE TABLE PAC_donate (
	from_committee_id char(9),
	to_committee_id char(9),
	FOREIGN KEY (from_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (to_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (from_committee_id, to_committee_id)
);

CREATE TABLE interested_in (
	committee_id char(9),
	industry_summary varchar(300),
	PRIMARY KEY(committee_id, industry_summary),
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (industry_summary) references Industries(summary) ON DELETE CASCADE
); 

CREATE TABLE advocates (
	name varchar(100), -- name of legislation
	summary varchar(300), -- summary of a cause/industry
	FOREIGN KEY (summary) REFERENCES Industries(summary)
	ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (name, summary)
);
CREATE TABLE super_PACs (
	committee_id char(9),
	name varchar(50),
	viewpoint varchar(30),
	budget real CHECK (budget >= 0),
	cash_spent real CHECK ((cash_spent <= budget) AND (cash_spent >= 0)),
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

CREATE TABLE SPAC_supports(
	committee_id char(9),
	name varchar(100),
	DOB date,
	amount real CHECK (amount >= 0),
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB)
);

CREATE TABLE SPAC_against(
	committee_id char(9),
	name varchar(100),
	DOB date,
	amount real CHECK (amount >= 0),
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB)
);
	
--- inserted up to here ---


-- get rid of participation constraint between politician and vote
-- Real world constraint - not all  bills get to the floor for a vote, but instead get dropped after being introduced.  
-- Representatives might vote, but if the bill is defeated in the House, Senators will never vote on the bill.
Create TABLE Vote(
	politician_name varchar(50),
	politician_DOB DATE,
	legislation_name varchar(100),
	voting_stage varchar (100), -- cloture, house, senate
	voted_for BOOLEAN, -- NULL if abstain from voting
	FOREIGN KEY (politican_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY(politician_name, politician_DOB, legislation_name)
);


