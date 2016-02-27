Create TABLE Politicians(
	name CHAR(50),
	DOB DATE,
	net_worth REAL,
	incumbent_status BOOLEAN,
	party_affiliation CHAR(20),
	years_in_office INTEGER,
	PRIMARY KEY (name, DOB));

Create TABLE Senators(
	name CHAR(50),
	DOB DATE,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE);

Create TABLE Representatives(
	name CHAR(50),
	DOB DATE,
	PRIMARY KEY(name, DOB),
	FOREIGN KEY(name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE); 

Create TABLE Industries(
	summary CHAR(300),
	PRIMARY KEY (summary));

Create TABLE Legislation(
	name CHAR(100),
	passed BOOLEAN,		
	PRIMARY KEY (name));


Create TABLE Super_PACs(
	committee_id CHAR(11),
	name CHAR(50),
	viewpoint CHAR(15),
	budget REAL,
	cash_spent REAL,
	PRIMARY KEY (committee_id),
	UNIQUE (name));

Create TABLE PACs(
	committee_id CHAR(11),
	name CHAR(50),
	budget REAL,
	cash_spent REAL,
	cash_on_hand REAL,
	registrant BOOLEAN,
	PRIMARY KEY (committee_id),
	UNIQUE (name));

Create TABLE Rep_State(
	state_name CHAR(15),
	major_ethnicity CHAR(50),
	median_age REAL,
	major_party CHAR(50),
	median_income REAL,
	poverty_level REAL,
	sr_senator_name CHAR(50) NOT NULL,
	sr_senator_DOB DATE NOT NULL,
	jr_senator_name CHAR(50) NOT NULL,
	jr_senator_DOB DATE NOT NULL,
	FOREIGN KEY (sr_senator_name, sr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	FOREIGN KEY (jr_senator_name, jr_senator_DOB) REFERENCES Senators(name, DOB) ON DELETE NO ACTION,
	UNIQUE (sr_senator_name, sr_senator_DOB),
	UNIQUE (jr_sentor_name, jr_senator_DOB),
	PRIMARY KEY (state_name));


Create TABLE Rep_District(
	state_name CHAR(15),
	district_number INTEGER,
	major_ethnicity CHAR(50),
	median_age REAL,
	major_party CHAR(50),
	median_income REAL,
	poverty_level REAL,
	representative_name CHAR(50) NOT NULL,
	representative_DOB DATE NOT NULL,
	FOREIGN KEY(name, DOB) REFERENCES Representatives(name, DOB)
	ON DELETE NO ACTION,
	UNIQUE (representative_name, representative_DOB),
	PRIMARY KEY (state_name, district_number));	

Create TABLE Advocates(
	summary CHAR(300),
	name CHAR(100),
	FOREIGN KEY (summary) REFERENCES Industries(summary)
	ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (name, summary));

Create TABLE P_Sponsors(
	legislation_name CHAR(100),
	p_sponsor_name CHAR(50),
	p_sponsor_DOB DATE,
	FOREIGN KEY (p_sponsor_name, p_sponsor_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (legislation_name) REFERENCES Legislation(name) ON DELETE CASCADE,
	PRIMARY KEY (legislation_name, p_sponsor_name, p_sponsor_DOB),
);

Create TABLE Interested_In(
	committee_id CHAR(11),
	industry_summary CHAR(300),
	PRIMARY KEY(committee_id, industry_summary),
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (industry_summary) references Industries(summary) ON DELETE CASCADE); 


Create TABLE SPAC_Supports(
	committee_id CHAR(11),
	name CHAR(100),
	DOB DATE,
	amount REAL,
	FOREIGN KEY (committee_id) REFERENCES Super_PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (name, DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, name, DOB));

Create TABLE PAC_Donate(
	from_committee_id CHAR(11),
	to_committee_id CHAR(11),
	FOREIGN KEY (from_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	FOREIGN KEY (to_committee_id) REFERENCES PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (from_committee_id, to_committee_id));

Create TABLE PAC_Supports(
	committee_id CHAR(11),
	politician_name CHAR(50),
	politician_DOB DATE,
	amount REAL,
	FOREIGN KEY (politician_name, politician_DOB) REFERENCES Politicians(name, DOB) ON DELETE CASCADE,
	FOREIGN KEY (committee_id) references PACs(committee_id) ON DELETE CASCADE,
	PRIMARY KEY (committee_id, politician_name, politician_DOB));
));

