-- senators

INSERT INTO politicians VALUES ('Harry Reid', '1939-12-02', 4638027., TRUE, 'Democrat', 27); 
INSERT INTO senators VALUES('Harry Reid', '1939-12-02');
INSERT INTO politicians VALUES ('Marco Rubio', ' 1971-05-28', 371006, TRUE, 'Republican', 3);
INSERT INTO senators VALUES('Marco Rubio', ' 1971-05-28');
INSERT INTO politicians VALUES ('Ted Cruz', '1970-12-22', 3013518, TRUE, 'Republican', 1);
INSERT INTO senators VALUES('Ted Cruz', '1970-12-22');
INSERT INTO politicians VALUES ('Chuck Schumer', '1950-11-23', 779008, TRUE, 'Democrat', 15);
INSERT INTO senators VALUES('Chuck Schumer', '1950-11-23');
INSERT INTO politicians VALUES ('Bernie Sanders', '1941-09-08', 436013, TRUE, 'Independent', 7);
INSERT INTO senators VALUES('Bernie Sanders', '1941-09-08');
INSERT INTO politicians VALUES ('Rand Paul', '1963-01-07', 1193018, TRUE, 'Republican', 3);
INSERT INTO senators VALUES('Rand Paul', '1963-01-07');
INSERT INTO politicians VALUES ('Mitch McConnell', '1942-02-20', 22164529, TRUE, 'Republican', 29);
INSERT INTO senators VALUES('Mitch McConnell', '1942-02-20');
INSERT INTO politicians VALUES ('Barbara Boxer', '1940-11-11', 3189004, TRUE, 'Democrat', 21);
INSERT INTO senators VALUES('Barbara Boxer', '1940-11-11');
INSERT INTO politicians VALUES ('Elizabeth Warren', '1949-06-22',  7484514, TRUE, 'Democrat', 1);
INSERT INTO senators VALUES('Elizabeth Warren', '1949-06-22');
INSERT INTO politicians VALUES ('John McCain', '1936-08-29', 19642067, TRUE, 'Republican', 27);
INSERT INTO senators VALUES('John McCain', '1936-08-29');
INSERT INTO politicians VALUES ('Dean Heller', '1960-05-10', 4740517, TRUE, 'Republican', 3);
INSERT INTO senators VALUES('Dean Heller', '1960-05-10');
INSERT INTO politicians VALUES ('Dianne Feinstein', '1933-06-22', 94202571, TRUE, 'Democrat', 22);
INSERT INTO senators VALUES('Dianne Feinstein', '1933-06-22');
INSERT INTO politicians VALUES ('Patrick Leahy', '1940-03-31', 257004, TRUE, 'Democrat', 39);
INSERT INTO senators VALUES('Patrick Leahy', '1940-03-31');
INSERT INTO politicians VALUES ('Bill Nelson', '1942-09-29', 3474012, TRUE, 'Democrat', 13);
INSERT INTO senators VALUES('Bill Nelson', '1942-09-29');
INSERT INTO politicians VALUES ('John Cornyn', '1952-02-02', 538008, TRUE, 'Republican', 12);
INSERT INTO senators VALUES('John Cornyn', '1952-02-02');
INSERT INTO politicians VALUES ('Kirsten Gillibrand', '1966-12-09', 231503, TRUE, 'Democrat', 5);
INSERT INTO senators VALUES('Kirsten Gillibrand', '1966-12-09');
INSERT INTO politicians VALUES ('Ed Markey', '1946-07-11', 2182513, TRUE, 'Democrat', 1);
INSERT INTO senators VALUES('Ed Markey', '1946-07-11');
INSERT INTO politicians VALUES ('Jeff Flake', '1962-12-31', 283001, TRUE, 'Republican', 1);
INSERT INTO senators VALUES('Jeff Flake', '1962-12-31');
INSERT INTO politicians VALUES ('Bob Menendez', '1954-01-01', 348502, TRUE, 'Democrat', 8);
INSERT INTO senators VALUES('Bob Menendez', '1954-01-01');
INSERT INTO politicians VALUES ('Cory Booker', '1969-04-27', 563002, TRUE, 'Democrat', 1);
INSERT INTO senators VALUES('Cory Booker', '1969-04-27');
INSERT INTO politicians VALUES ('Kay Hagan', '1953-05-26', 29007831, TRUE, 'Democrat', 5);
INSERT INTO senators VALUES ('Kay Hagan', '1953-05-26');
INSERT INTO politicians VALUES ('Richard Burr', '1955-11-30', 2636270, TRUE, 'Republican', 9);
INSERT INTO senators VALUES ('Richard Burr', '1955-11-30');

-- ADD LOUISIANA senators

-- representatives 
INSERT INTO politicians VALUES ('John Boehner', '1949-11-17', 4092054, TRUE, 'Republican', 23);
INSERT INTO politicians VALUES ('Nancy Pelosi', '1940-03-26', 101272023, TRUE, 'Democrat', 27);
INSERT INTO politicians VALUES ('Eric Cantor', '1963-06-06', 13073557, TRUE, 'Republican', 11);
INSERT INTO politicians VALUES ('Paul Ryan', '1970-01-29', 5067051, TRUE, 'Republican', 15);
INSERT INTO politicians VALUES ('Kevin McCarthy', '1965-01-26', 306504, TRUE, 'Republican', 7);
INSERT INTO politicians VALUES ('Tulsi Gabbard', '1981-04-12', 183504, TRUE, 'Democrat', 1);
INSERT INTO politicians VALUES ('Steny Hoyer', '1939-06-14', 33502, TRUE, 'Democrat', 33);
INSERT INTO politicians VALUES ('James Clyburn', '1940-07-21', 476011, TRUE, 'Democrat', 17);
INSERT INTO politicians VALUES ('Steve Scalise', '1965-10-06', -20999, TRUE, 'Republican', 6);
INSERT INTO politicians VALUES ('Cathy McMorris Rodgers', '1969-05-22', 1263509, TRUE, 'Republican', 1);

INSERT INTO representatives VALUES('John Boehner', '1949-11-17');
INSERT INTO representatives VALUES('Nancy Pelosi', '1940-03-26');
INSERT INTO representatives VALUES('Eric Cantor', '1963-06-06');
INSERT INTO representatives VALUES('Paul Ryan', '1970-01-29');
INSERT INTO representatives VALUES('Kevin McCarthy', '1965-01-26');
INSERT INTO representatives VALUES('Tulsi Gabbard', '1981-04-12');
INSERT INTO representatives VALUES('Steny Hoyer', '1939-06-14');
INSERT INTO representatives VALUES('James Clyburn', '1940-07-21');
INSERT INTO representatives VALUES('Steve Scalise', '1965-10-06');
INSERT INTO representatives VALUES ('Cathy McMorris Rodgers', '1969-05-22');

-- rep_state

INSERT INTO rep_state VALUES ('Kentucky', 4425092, 'White', 38.3, 'Republican', 43342, 19.1, 'Mitch McConnell','1942-02-20', 'Rand Paul', '1963-01-07'); 
INSERT INTO rep_state VALUES ('Nevada', 2890845, 'White', 36.9, 'Democrat',52205, 15.2, 'Harry Reid', '1939-12-02', 'Dean Heller', '1960-05-10');
INSERT INTO rep_state VALUES ('California', 39144818, 'White', 35.6, 'Democrat', 61489, 16.4, 'Dianne Feinstein', '1933-06-22', 'Barbara Boxer', '1940-11-11');
INSERT INTO rep_state VALUES ('Vermont', 626042, 'White', 37.7, 'Democrat', 54447, 12.2, 'Patrick Leahy', '1940-03-31', 'Bernie Sanders', '1941-09-08');
INSERT INTO rep_state VALUES ('Florida', 20271272, 'White', 40.7, 'Democrat', 47212, 16.5, 'Bill Nelson', '1942-09-29', 'Marco Rubio', '1971-05-28');
INSERT INTO rep_state VALUES ('Texas', 27469114, 'White', 33.6, 'Republican', 52576, 17.2, 'John Cornyn', '1952-02-02', 'Ted Cruz', '1970-12-22');
INSERT INTO rep_state VALUES ('New York', 19795791, 'White', 38.0, 'Democrat', 58687, 15.9, 'Chuck Schumer', '1950-11-23', 'Kirsten Gillibrand', '1966-12-09');
INSERT INTO rep_state VALUES ('Massachusetts', 6745408, 'White', 39.1, 'Democrat', 67846, 11.6, 'Elizabeth Warren', '1949-06-22', 'Ed Markey', '1946-07-11'); 
INSERT INTO rep_state VALUES ('Arizona', 6731484, 'White', 35.9, 'Republican', 49928, 18.2, 'John McCain', '1936-08-29', 'Jeff Flake', '1962-12-31');
INSERT INTO rep_state VALUES ('New Jersey', 8791894, 'White', 39.0, 'Democrat', 72062, 11.1, 'Bob Menendez', '1954-01-01', 'Cory Booker', '1969-04-27');
INSERT INTO rep_state VALUES ('North Carolina', 9943964, 'White', 37.4, 'Republican', 46334	, 17.5, 'Richard Burr', '1955-11-30', 'Kay Hagan', '1953-05-26');


-- rep_district

INSERT INTO rep_district VALUES ('Ohio', 8, 722889, 'White', 38.8, 'Republican', 51699, 10.2, 'John Boehner', '1949-11-17');
INSERT INTO rep_district VALUES ('California', 12, 736123,  'White', 38.6, 'Democrat', 85370, 6.9, 'Nancy Pelosi', '1940-03-26');
INSERT INTO rep_district VALUES ('Virginia', 7,  769995, 'White', 40.0, 'Republican', 74172, 5.0, 'Eric Cantor', '1963-06-06');
INSERT INTO rep_district VALUES ('Wisconsin', 1, 712072, 'White', 40.3, 'Republican', 58345, 8.4, 'Paul Ryan', '1970-01-29');
INSERT INTO rep_district VALUES ('California', 23,  747914, 'White', 32.9, 'Republican', 55195, 16.7, 'Kevin McCarthy', '1965-01-26');
INSERT INTO rep_district VALUES ('Hawaii', 2, 712020, 'White', 37.5, 'Democrat', 66042, 9.0, 'Tulsi Gabbard', '1981-04-12');
INSERT INTO rep_district VALUES ('Maryland', 5, 753079, 'White', 38.3, 'Democrat', 89671, 5.1, 'Steny Hoyer', '1939-06-14');
INSERT INTO rep_district VALUES ('South Carolina', 6, 673637, 'Black or African American', 35.0, 'Democrat', 32935, 20.6, 'James Clyburn', '1940-07-21');
INSERT INTO rep_district VALUES ('Louisiana', 1, 796858, 'White', 37.3, 'Republican', 54764, 10.2, 'Steve Scalise', '1965-10-06');
INSERT INTO rep_district VALUES ('Washington', 5, 690518, 'White', 37.4, 'Democrat', 47973, 11.5, 'Cathy McMorris Rodgers', '1969-05-22');

-- industries

INSERT INTO industries VALUES ('Agribusiness');
INSERT INTO industries VALUES ('Communications');
INSERT INTO industries VALUES ('Construction');
INSERT INTO industries VALUES ('Defense');
INSERT INTO industries VALUES ('Energy');
INSERT INTO industries VALUES ('Finance');
INSERT INTO industries VALUES ('Health');
INSERT INTO industries VALUES ('Liberal');
INSERT INTO industries VALUES ('Conservative');
INSERT INTO industries VALUES ('Labor');
INSERT INTO industries VALUES ('Lobbyists');
INSERT INTO industries VALUES ('Transportation');
INSERT INTO industries VALUES ('Alcohol');
INSERT INTO industries VALUES ('Casinos');
INSERT INTO industries VALUES ('Pro-gun');
INSERT INTO industries VALUES ('Anti-gun');
INSERT INTO industries VALUES ('Immigration');
INSERT INTO industries VALUES ('Veteran Affairs');
INSERT INTO industries VALUES ('Economics and Public Finance');
INSERT INTO industries VALUES ('Human Rights');
INSERT INTO industries VALUES ('Renewable Energy');
INSERT INTO industries VALUES ('Pro-Israel');
INSERT INTO industries VALUES ('Education');
INSERT INTO industries VALUES ('Pharmaceuticals');

-- not inserted yet
INSERT INTO industries VALUES ('Tobacco');
INSERT INTO industries VALUES ('Law Firms');

-- legislation 

INSERT INTO legislation VALUES ('S.9 - Clean And Fair Elections Act', FALSE); -- introduced, no roll call
INSERT INTO legislation VALUES ('S.2 - Sandy Hook Elementary School Violence Reduction Act', FALSE); -- introduced, no roll call
INSERT INTO legislation VALUES ('S. 1569 - Default Prevention Act of 2013', FALSE); -- Failed Cloture in the Senate
INSERT INTO legislation VALUES ('S. 260 - Immigration Enforcement Transparency Act', FALSE); -- introduced, no roll call
INSERT INTO legislation VALUES ('S. 2145 - Veteran Voting Support Act', FALSE); -- introduced, no roll call
INSERT INTO legislation VALUES ('S. 47 - Violence Against Women Reauthorization Act of 2013', TRUE); -- ENACTED
INSERT INTO legislation VALUES ('S. 1846 - Homeowner Flood Insurance Affordability Act of 2013', FALSE); -- no roll call
INSERT INTO legislation VALUES ('S. 2142 - Venezuela Defense of Human Rights and Civil Society Act of 2014', TRUE); -- ENACTED
INSERT INTO legislation VALUES ('S. 517 - Unlocking Consumer Choice and Wireless Competition Act', TRUE); -- ENACTED
INSERT INTO legislation VALUES ('H.R. 267 - Hydropower Regulatory Efficiency Act of 2013', TRUE); -- ENACTED
INSERT INTO legislation VALUES ('S. 177 - ObamaCare Repeal Act', FALSE); -- no roll call
INSERT INTO legislation VALUES ('S. 2415 - SuperPAC Elimination Act of 2014', FALSE); -- no roll call
INSERT INTO legislation VALUES ('S. 1837 -  Equal Employment for All Act of 2013', FALSE); -- introduced
INSERT INTO legislation VALUES ('S.Res. 28 - A resolution to provide sufficient time for legislation to be read.', FALSE); -- introduced
INSERT INTO legislation VALUES ('S. 2766 - Palestinian and United Nations Anti-Terrorism Act of 2014', FALSE); -- introduced
INSERT INTO legislation VALUES ('S. 2948 - Medicaid Generic Drug Price Fairness Act', FALSE); -- introduced
INSERT INTO legislation VALUES ('S. 2832 - Employ Young Americans Now Act', FALSE);
INSERT INTO legislation VALUES ('S.  2956 - Phone Scam Prevention Act of 2014', FALSE);
INSERT INTO legislation VALUES ('S. 2673 - United States-Israel Strategic Partnership Act of 2014', TRUE); -- ENACTED
INSERT INTO legislation VALUES ('S. 2340 - Simplifying Financial Aid for Students Act of 2014', FALSE);
INSERT INTO legislation VALUES ('S. 2733 - ObamaCare Opt Out Act of 2014', FALSE);
INSERT INTO legislation VALUES ('S. 150 - Assault Weapons Ban of 2013', FALSE); -- DEFEATED IN SENATE

INSERT INTO p_sponsors VALUES ('S.9 - Clean And Fair Elections Act', 'Harry Reid', '1939-12-02');
INSERT INTO p_sponsors VALUES ('S.2 - Sandy Hook Elementary School Violence Reduction Act', 'Harry Reid', '1939-12-02');
INSERT INTO p_sponsors VALUES ('S. 1569 - Default Prevention Act of 2013', 'Harry Reid', '1939-12-02');
INSERT INTO p_sponsors VALUES ('S. 260 - Immigration Enforcement Transparency Act', 'Kirsten Gillibrand', '1966-12-09');
INSERT INTO p_sponsors VALUES ('S. 2145 - Veteran Voting Support Act', 'Dianne Feinstein', '1933-06-22');
INSERT INTO p_sponsors VALUES ('S. 47 - Violence Against Women Reauthorization Act of 2013', 'Patrick Leahy', '1940-03-31');
INSERT INTO p_sponsors VALUES ('S. 1846 - Homeowner Flood Insurance Affordability Act of 2013', 'Bob Menendez', '1954-01-01');
INSERT INTO p_sponsors VALUES ('S. 2142 - Venezuela Defense of Human Rights and Civil Society Act of 2014', 'Bob Menendez', '1954-01-01');
INSERT INTO p_sponsors VALUES ('S. 517 - Unlocking Consumer Choice and Wireless Competition Act', 'Patrick Leahy', '1940-03-31');
INSERT INTO p_sponsors VALUES ('H.R. 267 - Hydropower Regulatory Efficiency Act of 2013', 'Cathy McMorris Rodgers', '1969-05-22');
INSERT INTO p_sponsors VALUES ('S. 177 - ObamaCare Repeal Act', 'Ted Cruz', '1970-12-22');
INSERT INTO p_sponsors VALUES ('S. 2415 - SuperPAC Elimination Act of 2014', 'Ted Cruz', '1970-12-22');
INSERT INTO p_sponsors VALUES ('S. 1837 -  Equal Employment for All Act of 2013', 'Elizabeth Warren', '1949-06-22');
INSERT INTO p_sponsors VALUES ('S.Res. 28 - A resolution to provide sufficient time for legislation to be read.', 'Rand Paul', '1963-01-07');
INSERT INTO p_sponsors VALUES ('S. 2766 - Palestinian and United Nations Anti-Terrorism Act of 2014', 'Marco Rubio', '1971-05-28');
INSERT INTO p_sponsors VALUES ('S. 2948 - Medicaid Generic Drug Price Fairness Act', 'Bernie Sanders', '1941-09-08');
INSERT INTO p_sponsors VALUES ('S. 2832 - Employ Young Americans Now Act', 'Bernie Sanders', '1941-09-08');
INSERT INTO p_sponsors VALUES ('S.  2956 - Phone Scam Prevention Act of 2014', 'Bill Nelson', '1942-09-29');
INSERT INTO p_sponsors VALUES ('S. 2673 - United States-Israel Strategic Partnership Act of 2014', 'Barbara Boxer', '1940-11-11');
INSERT INTO p_sponsors VALUES ('S. 2340 - Simplifying Financial Aid for Students Act of 2014', 'Cory Booker', '1969-04-27');
INSERT INTO p_sponsors VALUES ('S. 2733 - ObamaCare Opt Out Act of 2014', 'John McCain', '1936-08-29');
INSERT INTO p_sponsors VALUES ('S. 150 - Assault Weapons Ban of 2013', 'Dianne Feinstein', '1933-06-22');

-- all inserted up to here

