/*setupscript.sql
*
* ALTER TABLE RNC0 MODIFY ts TIMESTAMP(6)
*/

/* _Q tables set
*/
CREATE TABLE mad1_Q(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE mad2_Q(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE milw_Q(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE chic_Q(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

/* _Cb tables
*/
CREATE TABLE mad2_Cb (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value INT UNSIGNED,
	PRIMARY KEY (indexid)
);
CREATE TABLE chic_Cb (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value INT UNSIGNED,
	PRIMARY KEY (indexid)
);

/* Old Tables -- dont use 'em
CREATE TABLE RNUW (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts DECIMAL(19,9), 
	node VARCHAR(16), 
	instance VARCHAR(60), 
	value BIGINT,
	PRIMARY KEY (indexid)
);
CREATE TABLE RCOOpr (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts DECIMAL(19,9), 
	node VARCHAR(16), 
	instance VARCHAR(60), 
	value FLOAT,
	PRIMARY KEY (indexid)
);
CREATE TABLE RCOOpt (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts DECIMAL(19,9), 
	node VARCHAR(16), 
	instance VARCHAR(60), 
	value FLOAT,
	PRIMARY KEY (indexid)
);
CREATE TABLE RQF (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts DECIMAL(19,9), 
	node INT, 
	instance VARCHAR(60), 
	value FLOAT,
	PRIMARY KEY (indexid)
);
CREATE TABLE RBPreF (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts DECIMAL(19,9), 
	node VARCHAR(16), 
	instance VARCHAR(60), 
	value FLOAT,
	PRIMARY KEY (indexid)
);*/
