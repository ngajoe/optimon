/*setupscript.sql
*
* ALTER TABLE RNC0 MODIFY ts TIMESTAMP(6)
*/

/* _Q tables set
*/

/*MAD1 subset
*/
CREATE TABLE mad1_Q_12582986(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE mad1_Q_12582987(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE mad1_Q_12582988(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE mad1_Q_12582989(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
CREATE TABLE mad1_Q_12582990(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

/*MAD2 subset
*/
CREATE TABLE mad2_Q_12582985(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE mad2_Q_12582986(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE mad2_Q_12582987(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE mad2_Q_12582988(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE mad2_Q_12582989(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
/*MILW subset
*/
CREATE TABLE milw_Q_12584941(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE milw_Q_12584942(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE milw_Q_12584943(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE milw_Q_12584944(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE milw_Q_12584945(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
/*CHIC subset
*/
CREATE TABLE chic_Q_8399916(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE chic_Q_8399917(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE chic_Q_8399918(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE chic_Q_8399919(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
/*STPL subset
*/
CREATE TABLE stpl_Q_12585048(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE stpl_Q_12585049(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE stpl_Q_12585050(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE stpl_Q_12585051(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);

CREATE TABLE stpl_Q_12585052(
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	instance INT,
	value DECIMAL(5,2),
	PRIMARY KEY (indexid)
);
/*** _Cb tables
****
****
****
*/
CREATE TABLE mad2_Cb (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
	value INT UNSIGNED,
	PRIMARY KEY (indexid)
);

/*CHIC subset
*/
CREATE TABLE chic_Cb (
	indexid INT NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP(6),
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
