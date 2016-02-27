CREATE TABLE Politicians(
	name char(50),
	DOB date,
	net_worth real,
	incumbent_status boolean,
	party_affiliation char(20),
	years_in_office integer,
	PRIMARY KEY (name, DOB));

CREATE TABLE Senators(
	name char(50),
	DOB date,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE);

CREATE TABLE Representatives(
	name char(50),
	DOB date,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE); 

CREATE TABLE Industries(
	summary char(300),
	PRIMARY KEY (summary));

CREATE TABLE Legislation(
	name char(100),
	passed boolean NOTNULL, /* A Legislation must have either passed or failed */
	PRIMARY KEY (name));

CREATE TABLE Super_PACs(
	committee_id char(11),
	name char(50),
	viewpoint char(15),
	budget real,
	cash_spent real,
	PRIMARY KEY (committee_id),
	UNIQUE (name));

CREATE TABLE PACs(
	committee_id char(11),
	name char(50),
	budget real,
	cash_spent real,
	cash_on_hand real,
	registrant boolean,
	PRIMARY KEY (committee_id),
	UNIQUE (name));

CREATE TABLE Rep_State(
	state_name char(15),
	major_ethnicity char(50),
	median_age real,
	major_party char(50),
	median_income real,
	poverty_level real,
	sr_senator_name char(50) NOTNULL,
	sr_senator_DOB date NOTNULL,
	jr_senator_name char(50) NOTNULL,
	jr_senator_DOB date NOTNULL,
	FOREIGN KEY (sr_senator_name, sr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	FOREIGN KEY (jr_senator_name, jr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	UNIQUE (sr_senator_name, sr_senator_DOB),
	UNIQUE (jr_sentor_name, jr_senator_DOB),
	PRIMARY KEY (state_name));


CREATE TABLE Rep_District(
	state_name char(15),
	district_number integer,
	major_ethnicity char(50),
	median_age real,
	major_party char(50),
	median_income real,
	poverty_level real,
	representative_name char(50) NOTNULL,
	representative_DOB date NOTNULL,
	FOREIGN KEY(name, DOB) REFERENCES Representatives(name, DOB)
	ON DELETE NO ACTION,
	UNIQUE (representative_name, representative_DOB),
	PRIMARY KEY (state_name, district_number));	

CREATE TABLE Advocates(
	summary char(300),
	name char(100),
	FOREIGN KEY (summary) REFERENCES Industries(summary)
	ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (name, summary));

CREATE TABLE P_Sponsors(
	legislation_name char(100),
	p_sponsor_name char(50),
	p_sponsor_DOB date,
	FOREIGN KEY (p_sponsor_name, p_sponsor_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (legislation_name, p_sponsor_name, p_sponsor_DOB),
);

CREATE TABLE Interested_In(
	committee_id char(11),
	industry_summary char(300),
	PRIMARY KEY(committee_id, industry_summary),
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (industry_summary) references Industries(summary) ON DELETE CASCADE); 


CREATE TABLE SPAC_Supports(
	committee_id char(11),
	name char(100),
	DOB date,
	amount real,
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB));

CREATE TABLE PAC_Donate(
	from_committee_id char(11),
	to_committee_id char(11),
	FOREIGN KEY (from_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (to_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (from_committee_id, to_committee_id));

CREATE TABLE PAC_Supports(
	committee_id char(11),
	politician_name char(50),
	politician_DOB date,
	amount real,
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, politician_name, politician_DOB));

