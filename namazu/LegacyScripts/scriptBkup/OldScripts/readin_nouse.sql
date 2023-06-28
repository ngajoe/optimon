/*readin.sql
*
*/

LOAD DATA INFILE 'xtc1_transponder.RNC0.csv' INTO TABLE RNC0
FIELDS TERMINATED BY ','
LINES TERMINATED BY '/n'
(@ts, @node, @instance, @value)
SET ts = FROM_UNIXTIME(@ts);



/*DELETE BELO
CREATE TABLE RNC0 (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value BIGINT
	PRIMARY KEY (indexid)
);
CREATE TABLE RNC1 (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value BIGINT
	PRIMARY KEY (indexid)
);
CREATE TABLE RFCB (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value BIGINT
	PRIMARY KEY (indexid)
);
CREATE TABLE RNUW (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value BIGINT
	PRIMARY KEY (indexid)
);
CREATE TABLE RCOOpr (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value FLOAT
	PRIMARY KEY (indexid)
);
CREATE TABLE RCOOpt (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value FLOAT
	PRIMARY KEY (indexid)
);
CREATE TABLE RQF (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value FLOAT
	PRIMARY KEY (indexid)
);
CREATE TABLE RBPreF (indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP, 
	node INT, 
	instance VARCHAR(60), 
	value FLOAT
	PRIMARY KEY (indexid)
); */
