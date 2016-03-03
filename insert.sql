-- politicians
-- INSERT INTO politicians(name, DOB, net_worth, incumbent_status, party_affiliation, years_in_office)

-- senators
-- INSERT INTO senators(name, DOB)
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
INSERT INTO politicians VALUES ('Mary Landrieu', '1955-11-23', 1588507, TRUE, 'Democrat', 18);
INSERT INTO senators VALUES ('Mary Landrieu', '1955-11-23');
INSERT INTO politicians VALUES ('David Vitter', '1961-05-03', 1570522, TRUE, 'Republican', 10);
INSERT INTO senators VALUES ('David Vitter', '1961-05-03');

-- representatives 
-- INSERT INTO representatives(name, DOB)
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
-- INSERT INTO rep_state (state_name, population, major_ethnicity, median_age, major_party, median_income, poverty_level, sr_sen name, sr_sen dob, jr_sen name, jr_sen dob, percentage_minorities);
INSERT INTO rep_state VALUES ('Kentucky', 4425092, 'White', 38.3, 'Republican', 43342, 19.1, 'Mitch McConnell','1942-02-20', 'Rand Paul', '1963-01-07', 11.7); 
INSERT INTO rep_state VALUES ('Nevada', 2890845, 'White', 36.9, 'Democrat',52205, 15.2, 'Harry Reid', '1939-12-02', 'Dean Heller', '1960-05-10', 23.8);
INSERT INTO rep_state VALUES ('California', 39144818, 'White', 35.6, 'Democrat', 61489, 16.4, 'Dianne Feinstein', '1933-06-22', 'Barbara Boxer', '1940-11-11', 26.8);
INSERT INTO rep_state VALUES ('Vermont', 626042, 'White', 37.7, 'Democrat', 54447, 12.2, 'Patrick Leahy', '1940-03-31', 'Bernie Sanders', '1941-09-08', 5);
INSERT INTO rep_state VALUES ('Florida', 20271272, 'White', 40.7, 'Democrat', 47212, 16.5, 'Bill Nelson', '1942-09-29', 'Marco Rubio', '1971-05-28', 22.2);
INSERT INTO rep_state VALUES ('Texas', 27469114, 'White', 33.6, 'Republican', 52576, 17.2, 'John Cornyn', '1952-02-02', 'Ted Cruz', '1970-12-22', 20);
INSERT INTO rep_state VALUES ('New York', 19795791, 'White', 38.0, 'Democrat', 58687, 15.9, 'Chuck Schumer', '1950-11-23', 'Kirsten Gillibrand', '1966-12-09', 29.6);
INSERT INTO rep_state VALUES ('Massachusetts', 6745408, 'White', 39.1, 'Democrat', 67846, 11.6, 'Elizabeth Warren', '1949-06-22', 'Ed Markey', '1946-07-11', 17.4); 
INSERT INTO rep_state VALUES ('Arizona', 6731484, 'White', 35.9, 'Republican', 49928, 18.2, 'John McCain', '1936-08-29', 'Jeff Flake', '1962-12-31', 16.3);
INSERT INTO rep_state VALUES ('New Jersey', 8791894, 'White', 39.0, 'Democrat', 72062, 11.1, 'Bob Menendez', '1954-01-01', 'Cory Booker', '1969-04-27', 17);
INSERT INTO rep_state VALUES ('North Carolina', 9943964, 'White', 37.4, 'Republican', 46334	, 17.5, 'Richard Burr', '1955-11-30', 'Kay Hagan', '1953-05-26', 28.5);
INSERT INTO rep_state VALUES ('Louisiana', 4649676, 'White', 35.9 , 'Democrat', 44874, 19.1, 'Mary Landrieu', '1955-11-23', 'David Vitter', '1961-05-03', 36.6);

-- rep_district
-- INSERT INTO rep_dist VALUE(state_name, district_number, population, major_ethnicity, median_age, major_party, median_income, poverty_level, rep_name, rep_dob);
INSERT INTO rep_district VALUES ('Ohio', 8, 722889, 'White', 38.8, 'Republican', 51699, 10.2, 'John Boehner', '1949-11-17', 10.5);
INSERT INTO rep_district VALUES ('California', 12, 736123,  'White', 38.6, 'Democrat', 85370, 6.9, 'Nancy Pelosi', '1940-03-26', 47.7);
INSERT INTO rep_district VALUES ('Virginia', 7,  769995, 'White', 40.0, 'Republican', 74172, 5.0, 'Eric Cantor', '1963-06-06', 22.8);
INSERT INTO rep_district VALUES ('Wisconsin', 1, 712072, 'White', 40.3, 'Republican', 58345, 8.4, 'Paul Ryan', '1970-01-29', 11.2);
INSERT INTO rep_district VALUES ('California', 23,  747914, 'White', 32.9, 'Republican', 55195, 16.7, 'Kevin McCarthy', '1965-01-26', 24.2);
INSERT INTO rep_district VALUES ('Hawaii', 2, 712020, 'White', 37.5, 'Democrat', 66042, 9.0, 'Tulsi Gabbard', '1981-04-12', 67.5);
INSERT INTO rep_district VALUES ('Maryland', 5, 753079, 'White', 38.3, 'Democrat', 89671, 5.1, 'Steny Hoyer', '1939-06-14', 45.7);
INSERT INTO rep_district VALUES ('South Carolina', 6, 673637, 'Black or African American', 35.0, 'Democrat', 32935, 20.6, 'James Clyburn', '1940-07-21', 61.6);
INSERT INTO rep_district VALUES ('Louisiana', 1, 796858, 'White', 37.3, 'Republican', 54764, 10.2, 'Steve Scalise', '1965-10-06', 19.7);
INSERT INTO rep_district VALUES ('Washington', 5, 690518, 'White', 37.4, 'Democrat', 47973, 11.5, 'Cathy McMorris Rodgers', '1969-05-22', 11.1);

-- industries
-- INSERT INTO industries VALUE(summary);
INSERT INTO industries VALUES ('Agribusiness');
INSERT INTO industries VALUES ('Communications');
INSERT INTO industries VALUES ('Construction');
INSERT INTO industries VALUES ('Defense');
INSERT INTO industries VALUES ('Energy');
INSERT INTO industries VALUES ('Finance');
INSERT INTO industries VALUES ('Healthcare');
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
INSERT INTO industries VALUES ('Fossil Fuels');
INSERT INTO industries VALUES ('Pro-Israel');
INSERT INTO industries VALUES ('Education');
INSERT INTO industries VALUES ('Pharmaceuticals');
INSERT INTO industries VALUES ('Tobacco');
INSERT INTO industries VALUES ('Law Firms');
INSERT INTO industries VALUES ('Food Industry');

-- legislation 
-- INSERT INTO legislation VALUE(name, passed);
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

-- p_sponsors
-- INSERT INTO p_sponsor VALUE(legislation_name, p_sponsor_name, p_sponsor_dob);
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

-- advocates
-- INSERT INTO advocates VALUES (summary_of_industry, legislation_name);

-- pacs
-- INSERT INTO interested_in VALUES (committee_id, name, budget, cash_spent, cash_on_hand, registrant);
INSERT INTO interested_in VALUES ('C00327395', 'Searchlight Leadership Fund', 1766119.10, 1830124.90, 115526.83, FALSE);
INSERT INTO interested_in VALUES ('C00010082', 'National Cable and Telecommunications', 1549137, 1221381, 1420765, TRUE);
INSERT INTO interested_in VALUES ('C00385120', '21st Century Oncology', 65540, 61547, 12174, TRUE);
INSERT INTO interested_in VALUES ('C00500025', 'Reclaim America PAC', 3905826.00, 4035978.40, 31368.05, FALSE);
INSERT INTO interested_in VALUES ('C00296624', 'Florida Crystals', 0, 1500, 4662, TRUE);
INSERT INTO interested_in VALUES ('C00350744', 'Goldman Sachs', 911470, 920900, 436587, TRUE);
INSERT INTO interested_in VALUES ('C00536540', 'Jobs Growth and Freedom Fund', 2196311.00, 2065201.40, 131109.65, FALSE);
INSERT INTO interested_in VALUES ('C00236489', 'Koch Industries', 1961014, 1578819, 948449, TRUE);
INSERT INTO interested_in VALUES ('C00303024', 'Lockheed Martin', 2624382, 2630503, 1571852, TRUE);
INSERT INTO interested_in VALUES ('C00348607', 'Impact', 1056282.20, 1028380.40, 84754.44, FALSE);
INSERT INTO interested_in VALUES ('C00030718', 'National Realtors Association', 5250475, 2895019, 4881515, TRUE);
INSERT INTO interested_in VALUES ('C00144766', 'National Beer Wholesalers PAC', 2267002, 1939801, 254792, TRUE);
INSERT INTO interested_in VALUES ('C00406553', 'Progressive Voters of America', 535198.60, 405283.50, 134048.52, FALSE);
INSERT INTO interested_in VALUES ('C00411330', 'Friends of Bernie Sanders', 1196907, 1721802, 4440543, TRUE);
INSERT INTO interested_in VALUES ('C00493924', 'Reinventing a New Direction Political Action Committee', 3,742,138.10, 4,007,196.50, 160,439.81, FALSE);
INSERT INTO interested_in VALUES ('C00481200', 'National Association of Gun Rights', 81143, 57247, 195686, TRUE);
INSERT INTO interested_in VALUES ('C00109017', 'AT&T', 2913918, 2234210, 579962, TRUE);
INSERT INTO interested_in VALUES ('C00235655', 'Bluegrass Committee', 1128851.80, 1361659.60, 139152.02, FALSE);
INSERT INTO interested_in VALUES ('C00089136', 'Altria PAC', 1196396, 1097784, 82889, TRUE);
INSERT INTO interested_in VALUES ('C00359588', 'BGR PAC', 61569, 56365, 822, TRUE);
INSERT INTO interested_in VALUES ('C00342048', 'PAC for a Change', 1129172.00, 1134652.50, 198572.95, FALSE);
INSERT INTO interested_in VALUES ('C00493940', 'Masimo Corporation PAC', 31375, 10295, 2800, TRUE);
INSERT INTO interested_in VALUES ('C00024521', 'American Association for Justice PAC', 3058061, 3236809, 441212, TRUE);
INSERT INTO interested_in VALUES ('C00471607', 'HellerHighwater PAC', 686280.10, 664119.00, 42550.34, FALSE);
INSERT INTO interested_in VALUES ('C00227744', 'Ernst & Young PAC', 2021529, 1233558, 540780, TRUE);
INSERT INTO interested_in VALUES ('C00433219', 'Fund for the Majority PAC', 408960.60, 373373.40, 52046.39, FALSE);
INSERT INTO interested_in VALUES ('C00004275', 'American Bankers Association', 1934540, 1500574, 1613682, TRUE);
INSERT INTO interested_in VALUES ('C00251876', 'Amgen PAC', 1005785, 952185, 293911, TRUE);
INSERT INTO interested_in VALUES ('C00409110', 'Green Mountain PAC', 716023.70, 730923.90, 43086.91, FALSE);
INSERT INTO interested_in VALUES ('C00110338', 'American Crystal Sugar PAC', 1461832, 1360501, 1307526, TRUE);
INSERT INTO interested_in VALUES ('C00375451', 'Moving America Forward', 403050.00, 395827.70, 34720.45, FALSE);
INSERT INTO interested_in VALUES ('C00286922', 'Blue Cross/Blue Shield', 26715, 30000, 11330, TRUE);
INSERT INTO interested_in VALUES ('C00387464', 'Alamo PAC', 1202061.70, 1314736.80, 141722.09, FALSE);
INSERT INTO interested_in VALUES ('C00477067', 'Empire Political Action Committee', 394358.00, 318767.90, 171794.57, FALSE);
INSERT INTO interested_in VALUES ('C00006080', 'American Healthcare Association PAC', 666237, 705638, 213354, TRUE);
INSERT INTO interested_in VALUES ('C00008474', 'Citigroup PAC', 857989, 701833, 225470, TRUE);
INSERT INTO interested_in VALUES ('C00564187', 'Educate and Innovate PAC', 139000.00, 84753.90, 54246.12, FALSE);
INSERT INTO interested_in VALUES ('C00483677', 'American Petroleum Institute', 215930, 100526, 13959, TRUE);
INSERT INTO interested_in VALUES ('C00432930', 'Fiscal Leadership and Knowing Economics PAC', 345476.60, 315183.70, 36636.14, FALSE);
INSERT INTO interested_in VALUES ('C00078451', 'General Dynamics PAC', 1082555, 1018597, 373307, TRUE);
INSERT INTO interested_in VALUES ('C00181826', 'Aetna PAC', 651825, 733750, 360510, TRUE);
INSERT INTO interested_in VALUES ('C00349233', 'New Millennium PAC', 444727.80, 458030.80, 141791.52, FALSE);
INSERT INTO interested_in VALUES ('C00415752', 'Border Health PAC', 500639, 829935, 664840, TRUE);
INSERT INTO interested_in VALUES ('C00305805', 'The Freedom Project', 3662245.00, 3043827.10, 890661.12, FALSE);
INSERT INTO interested_in VALUES ('C00330233', 'Alliance Coal', 500639, 829935, 664840, TRUE);
INSERT INTO interested_in VALUES ('C00039321', 'PepsiCo', 278863, 185279, 265232, TRUE);
INSERT INTO interested_in VALUES ('C00344234', 'PAC to the Future', 1229800.00, 864312.90, 561,670.96, FALSE);
INSERT INTO interested_in VALUES ('C00104901', 'Akin Gump et al', 393869, 433920, 89882, TRUE);
INSERT INTO interested_in VALUES ('C00384701', 'Every Republican is Crucial PAC', 4088262, 4544979, 882162, FALSE);
INSERT INTO interested_in VALUES ('C00377689', 'Prosperity Action Inc.', 3788202.60, 4371582.50, 331971.84, FALSE);
INSERT INTO interested_in VALUES ('C00040279', 'Abbott Laboratories', 1000399, 1047962, 13218, TRUE);
INSERT INTO interested_in VALUES ('C00428052', 'Majority Commmittee PAC', 3298846.00, 2730502.90, 625252.41, FALSE);
INSERT INTO interested_in VALUES ('C00104299', 'J.P. Morgan Chase', 1183520, 830000, 347812, TRUE);
INSERT INTO interested_in VALUES ('C00542993', 'Time to Unite Lead and Serve with Integrity', 48075.00, 42119.60, 5955.42, FALSE);
INSERT INTO interested_in VALUES ('C00027342', 'International Brotherhood of Electric Workers PAC', 5427820, 4938247, 986673, TRUE);
INSERT INTO interested_in VALUES ('C00271338', 'AmeriPAC: the Fund for a Greater America', 2284242.00, 2593085.80, 772314.07, FALSE);
INSERT INTO interested_in VALUES ('C00399196', 'Bridge PAC', 1323963.60, 1203316.00, 277332.68, FALSE);
INSERT INTO interested_in VALUES ('C00095869', 'Edison Electric PowerPAC', 488291, 371000, 53438, TRUE);
INSERT INTO interested_in VALUES ('C00469429', 'CMR PAC', 757719.50, 756271.80, 6678.97, FALSE);

-- pac_supports
-- lists "Leadership PACs" == pacs affiliated with a poltiician
-- INSERT INTO pac_supports VALUES (committeeID, politician_name, politician_DOB, amount);
 INSERT INTO pac_supports VALUES ('C00327395', 'Harry Reid', '1939-12-02', 876826.70);
 INSERT INTO pac_supports VALUES ('C00500025', 'Marco Rubio', ' 1971-05-28', 3905826.00);
 INSERT INTO pac_supports VALUES ('C00536540', 'Ted Cruz', '1970-12-22', 2196311.00);
 INSERT INTO pac_supports VALUES ('C00348607', 'Chuck Schumer', '1950-11-23', 1056282.20);
 INSERT INTO pac_supports VALUES ('C00406553', 'Bernie Sanders', '1941-09-08', 535198.60);
 INSERT INTO pac_supports VALUES ('C00493924', 'Rand Paul', '1963-01-07', 3742138.10);
 INSERT INTO pac_supports VALUES ('C00235655', 'Mitch McConnell', '1942-02-20', 1128851.80);
 INSERT INTO pac_supports VALUES ('C00342048', 'Barbara Boxer', '1940-11-11', 1129172.00);
 INSERT INTO pac_supports VALUES ('C00471607', 'Dean Heller', '1960-05-10', 686280.10);
 INSERT INTO pac_supports VALUES ('C00433219', 'Dianne Feinstein', '1933-06-22', 408960.60);
 INSERT INTO pac_supports VALUES ('C00409110', 'Patrick Leahy', '1940-03-31', 716023.70);
 INSERT INTO pac_supports VALUES ('C00375451', 'Bill Nelson', '1942-09-29', 403050.00);
 INSERT INTO pac_supports VALUES ('C00387464', 'John Cornyn', '1952-02-02', 1202061.70);
 INSERT INTO pac_supports VALUES ('C00477067', 'Kirsten Gillibrand', '1966-12-09', 394358.00);
 INSERT INTO pac_supports VALUES ('C00564187', 'Ed Markey', '1946-07-11', 139000.00);
 INSERT INTO pac_supports VALUES ('C00432930', 'Jeff Flake', '1962-12-31', 345476.60);
 INSERT INTO pac_supports VALUES ('C00349233', 'Bob Menendez', '1954-01-01', 444727.80);
 INSERT INTO pac_supports VALUES ('C00305805', 'John Boehner', '1949-11-17', 3662245.00);
 INSERT INTO pac_supports VALUES ('C00344234', 'Nancy Pelosi', '1940-03-26', 1229800.00);
 INSERT INTO pac_supports VALUES ('C00377689', 'Paul Ryan', '1970-01-29', 3788202.60);
 INSERT INTO pac_supports VALUES ('C00428052', 'Kevin McCarthy', '1965-01-26', 3298846.00);
 INSERT INTO pac_supports VALUES ('C00542993', 'Tulsi Gabbard', '1981-04-12', 48075.00);
 INSERT INTO pac_supports VALUES ('C00271338', 'Steny Hoyer', '1939-06-14', 2284242.00);
 INSERT INTO pac_supports VALUES ('C00399196', 'James Clyburn', '1940-07-21', 1323963.60);
 INSERT INTO pac_supports VALUES ('C00469429', 'Cathy McMorris Rodgers', '1969-05-22', 757719.50);

-- pac_donate
-- INSERT INTO pac_donate VALUES (from_committeeID, to_committeeID);
INSERT INTO pac_donate VALUES ('C00010082', 'C00327395');
INSERT INTO pac_donate VALUES ('C00385120', 'C00327395');
INSERT INTO pac_donate VALUES ('C00296624', 'C00500025');
INSERT INTO pac_donate VALUES ('C00350744', 'C00500025');
INSERT INTO pac_donate VALUES ('C00236489', 'C00536540');
INSERT INTO pac_donate VALUES ('C00303024', 'C00536540');
INSERT INTO pac_donate VALUES ('C00030718', 'C00348607');
INSERT INTO pac_donate VALUES ('C00144766', 'C00348607');
INSERT INTO pac_donate VALUES ('C00411330', 'C00406553');
INSERT INTO pac_donate VALUES ('C00481200', 'C00493924');
INSERT INTO pac_donate VALUES ('C00109017', 'C00493924');
INSERT INTO pac_donate VALUES ('C00089136', 'C00235655');
INSERT INTO pac_donate VALUES ('C00359588', 'C00235655');
INSERT INTO pac_donate VALUES ('C00493940', 'C00342048');
INSERT INTO pac_donate VALUES ('C00024521', 'C00342048');
INSERT INTO pac_donate VALUES ('C00227744', 'C00471607');
INSERT INTO pac_donate VALUES ('C00109017', 'C00471607');
INSERT INTO pac_donate VALUES ('C00004275', 'C00433219');
INSERT INTO pac_donate VALUES ('C00251876', 'C00433219');
INSERT INTO pac_donate VALUES ('C00024521', 'C00409110');
INSERT INTO pac_donate VALUES ('C00110338', 'C00409110');
INSERT INTO pac_donate VALUES ('C00286922', 'C00375451');
INSERT INTO pac_donate VALUES ('C00024521', 'C00375451');
INSERT INTO pac_donate VALUES ('C00286922', 'C00387464');
INSERT INTO pac_donate VALUES ('C00089136', 'C00387464');
INSERT INTO pac_donate VALUES ('C00006080', 'C00477067');
INSERT INTO pac_donate VALUES ('C00008474', 'C00477067');
INSERT INTO pac_donate VALUES ('C00024521', 'C00564187');
INSERT INTO pac_donate VALUES ('C00483677', 'C00564187');
INSERT INTO pac_donate VALUES ('C00078451', 'C00432930');
INSERT INTO pac_donate VALUES ('C00181826', 'C00432930');
INSERT INTO pac_donate VALUES ('C00415752', 'C00349233');
INSERT INTO pac_donate VALUES ('C00109017', 'C00349233');
INSERT INTO pac_donate VALUES ('C00330233', 'C00305805');
INSERT INTO pac_donate VALUES ('C00039321', 'C00305805');
INSERT INTO pac_donate VALUES ('C00030718', 'C00344234');
INSERT INTO pac_donate VALUES ('C00104901', 'C00344234');
INSERT INTO pac_donate VALUES ('C00350744', 'C00384701');
INSERT INTO pac_donate VALUES ('C00089136', 'C00384701');
INSERT INTO pac_donate VALUES ('C00008474', 'C00384701');
INSERT INTO pac_donate VALUES ('C00236489', 'C00377689');
INSERT INTO pac_donate VALUES ('C00040279', 'C00377689');
INSERT INTO pac_donate VALUES ('C00089136', 'C00428052');
INSERT INTO pac_donate VALUES ('C00104299', 'C00428052');
INSERT INTO pac_donate VALUES ('C00027342', 'C00542993');
INSERT INTO pac_donate VALUES ('C00303024', 'C00542993');
INSERT INTO pac_donate VALUES ('C00104901', 'C00271338');
INSERT INTO pac_donate VALUES ('C00286922', 'C00271338');
INSERT INTO pac_donate VALUES ('C00095869', 'C00399196');
INSERT INTO pac_donate VALUES ('C00040279', 'C00399196');
INSERT INTO pac_donate VALUES ('C00004275', 'C00469429');
INSERT INTO pac_donate VALUES ('C00104299', 'C00469429');

-- interested_in
-- lists "Industry PACs" == pacs funded by a company
-- INSTERT INTO interested_in(PAC_committee_ID, industry_summary)
INSERT INTO interested_in VALUES ('C00010082', 'Communications');
INSERT INTO interested_in VALUES ('C00385120', 'Health');
INSERT INTO interested_in VALUES ('C00296624', 'Agribusiness');
INSERT INTO interested_in VALUES ('C00350744', 'Finance');
INSERT INTO interested_in VALUES ('C00236489', 'Finance');
INSERT INTO interested_in VALUES ('C00303024', 'Defense');
INSERT INTO interested_in VALUES ('C00030718', 'Law Firms');
INSERT INTO interested_in VALUES ('C00144766', 'Alcohol');
INSERT INTO interested_in VALUES ('C00411330', 'Liberal');
INSERT INTO interested_in VALUES ('C00481200', 'Pro-gun');
INSERT INTO interested_in VALUES ('C00109017', 'AT&T', 'Communications');
INSERT INTO interested_in VALUES ('C00089136', 'Tobacco');
INSERT INTO interested_in VALUES ('C00359588', 'Lobbyists');
INSERT INTO interested_in VALUES ('C00493940', 'Health');
INSERT INTO interested_in VALUES ('C00024521', 'Law Firms');
INSERT INTO interested_in VALUES ('C00227744', 'Finance');
INSERT INTO interested_in VALUES ('C00004275', 'Finance');
INSERT INTO interested_in VALUES ('C00251876', 'Pharmaceuticals');
INSERT INTO interested_in VALUES ('C00110338', 'Agribusiness');
INSERT INTO interested_in VALUES ('C00006080', 'Health');
INSERT INTO interested_in VALUES ('C00008474', 'Finance');
INSERT INTO interested_in VALUES ('C00483677', 'Fossil Fuels');
INSERT INTO interested_in VALUES ('C00078451', 'Defense');
INSERT INTO interested_in VALUES ('C00181826', 'Healthcare');
INSERT INTO interested_in VALUES ('C00415752', 'Healthcare');
INSERT INTO interested_in VALUES ('C00330233', 'Fossil Fuels');
INSERT INTO interested_in VALUES ('C00039321', 'Food Industry');
INSERT INTO interested_in VALUES ('C00104901', 'Law Firms');
INSERT INTO interested_in VALUES ('C00040279', 'Healthcare');
INSERT INTO interested_in VALUES ('C00104299', 'Finance');
INSERT INTO interested_in VALUES ('C00027342', 'Labor');
INSERT INTO interested_in VALUES ('C00095869', 'Energy');


--------------------------------------------------------- all inserted up to here

-- super_pacs
-- INSERT INTO super_pacs(committee_id, name, viewpoint, budget, cash_spent);

-- spac_supports
-- INSERT INTO spac_supports VALUE(committeeID, politician_name, politician_DOB, amount);

-- spac_against
-- INSERT INTO spac_against VALUE(committeeID, politician_name, politician_DOB, amount);

