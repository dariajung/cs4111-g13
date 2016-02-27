CREATE TABLE politicians (
	name varchar(50),
	DOB date,
	net_worth real,
	incumbent_status boolean,
	party_affiliation varchar(30),
	years_in_office integer,
	PRIMARY KEY (name, DOB)
);

CREATE TABLE senators (
	name varchar(50),
	DOB date,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE
);

CREATE TABLE representatives (
	name varchar(50),
	DOB date,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE
); 

CREATE TABLE industries (
	summary varchar(300),
	PRIMARY KEY (summary)
);

CREATE TABLE legislation (
	name varchar(100),
	passed boolean NOTNULL, -- A Legislation must have either passed or failed 
	PRIMARY KEY (name)
);

CREATE TABLE super_PACs (
	committee_id char(11),
	name varchar(50),
	viewpoint varchar(30),
	budget real,
	cash_spent real,
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

CREATE TABLE PACs (
	committee_id char(11),
	name varchar(50),
	budget real,
	cash_spent real,
	cash_on_hand real,
	registrant boolean,
	PRIMARY KEY (committee_id),
	UNIQUE (name)
);

CREATE TABLE rep_state (
	state_name varchar(15),
	major_ethnicity varchar(50),
	median_age real,
	major_party varchar(50),
	median_income real,
	poverty_level real,
	sr_senator_name varchar(50) NOTNULL,
	sr_senator_DOB date NOTNULL,
	jr_senator_name varchar(50) NOTNULL,
	jr_senator_DOB date NOTNULL,
	FOREIGN KEY (sr_senator_name, sr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	FOREIGN KEY (jr_senator_name, jr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	UNIQUE (sr_senator_name, sr_senator_DOB),
	UNIQUE (jr_sentor_name, jr_senator_DOB),
	PRIMARY KEY (state_name)
);

CREATE TABLE rep_district (
	state_name varchar(15),
	district_number integer,
	major_ethnicity varchar(50),
	median_age real,
	major_party varchar(50),
	median_income real,
	poverty_level real,
	representative_name varchar(50) NOTNULL,
	representative_DOB date NOTNULL,
	FOREIGN KEY(name, DOB) REFERENCES Representatives(name, DOB)
	ON DELETE NO ACTION,
	UNIQUE (representative_name, representative_DOB),
	PRIMARY KEY (state_name, district_number)
);	

CREATE TABLE advocates (
	summary varchar(300), -- summary of a cause/industry
	name varchar(100), -- name of legislation
	FOREIGN KEY (summary) REFERENCES Industries(summary)
	ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (name, summary)
);

CREATE TABLE p_sponsors (
	legislation_name varchar(100),
	p_sponsor_name varchar(50),
	p_sponsor_DOB date,
	FOREIGN KEY (p_sponsor_name, p_sponsor_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (legislation_name, p_sponsor_name, p_sponsor_DOB),
);

CREATE TABLE interested_in (
	committee_id char(11),
	industry_summary varchar(300),
	PRIMARY KEY(committee_id, industry_summary),
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (industry_summary) references Industries(summary) ON DELETE CASCADE
); 

CREATE TABLE SPAC_supports(
	committee_id char(11),
	name varchar(100),
	DOB date,
	amount real,
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB)
);

CREATE TABLE PAC_donate (
	from_committee_id char(11),
	to_committee_id char(11),
	FOREIGN KEY (from_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (to_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (from_committee_id, to_committee_id)
);

CREATE TABLE PAC_supports (
	committee_id char(11),
	politician_name varchar(50),
	politician_DOB date,
	amount real,
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, politician_name, politician_DOB)
);

