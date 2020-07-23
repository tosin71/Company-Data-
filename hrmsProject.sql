CREATE DATABASE employee_tosin

CREATE TABLE country
    (
	country_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	country_name NVARCHAR(50) NOT NULL UNIQUE
	);

CREATE TABLE state
    (
	state_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	country_id NUMERIC(10) NOT NULL,
	state_name NVARCHAR(50) NOT NULL
	);

CREATE TABLE city
    (
	city_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	state_id NUMERIC(10) NOT NULL FOREIGN KEY REFERENCES state(state_id),
	city_name NVARCHAR(50) NOT NULL 
	);

CREATE TABLE designation 
    (
	desig_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	desig_name NVARCHAR(50) NOT NULL UNIQUE,
	desig_description NVARCHAR(300) NOT NULL
	);

CREATE TABLE employee_details
    (
	emp_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	emp_first_name NVARCHAR(50) NOT NULL,
	emp_middle_name NVARCHAR(50),
	emp_last_name NVARCHAR(50) NOT NULL,
	emp_address1 NVARCHAR(100) NOT NULL,
	emp_address2 NVARCHAR(100),
	emp_country_id NUMERIC(10) NOT NULL FOREIGN KEY REFERENCES country(country_id),
	emp_state_id NUMERIC(10) NOT NULL FOREIGN KEY REFERENCES state(state_id),
	emp_city_id NUMERIC(10) NOT NULL FOREIGN KEY REFERENCES city(city_id),
	emp_zip NUMERIC(5) NOT NULL,
	emp_mobile NUMERIC(10) NOT NULL,
	emp_gender BIT NOT NULL,
	desig_id NUMERIC(10) NOT NULL,
	emp_dob DATETIME NOT NULL,
	emp_joindate DATETIME NOT NULL,
	emp_active BIT NOT NULL 
	);

CREATE TABLE salary
    (
	salary_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	emp_id NUMERIC(10) NOT NULL,
	emp_salary_change_year DATETIME NOT NULL,
	emp_salary DECIMAL(10,2) NOT NULL
	);

CREATE TABLE employee_documents
    (
	emp_doc_id NUMERIC(10) NOT NULL IDENTITY(1,1) PRIMARY KEY,
	emp_id NUMERIC(10) NOT NULL FOREIGN KEY REFERENCES employee_details(emp_id),
	emp_doc_name NVARCHAR(30) NOT NULL,
	emp_doc_desc NVARCHAR(150)
	);

SET IDENTITY_INSERT country ON 
GO 
INSERT INTO country(country_id, country_name)
VALUES 

(1,'Afghanistan'),
(2,'Albania'),
(3,'Algeria'),
(4,'Andorra'),
(5,'Australia'),
(6,'Austria'),
(7,'Brazil'),
(8,'Bangladesh'),
(9,'China'),
(10,'Chile'),
(11,'Denmark'),
(12,'Egypt'),
(13,'Ethiopia'),
(14,'France'),
(15,'Finland'),
(16,'Germany'),
(17,'Georgia'),
(18,'Greece'),
(19,'Hong Kong'),
(20,'Hungary'),
(21,'India'),
(22,'Ireland'),
(23,'Japan'),
(24,'Kuwait'),
(25,'Kenya'),
(26,'Luxembourg'),
(27,'Mexico'),
(28,'Nepal'),
(29,'Oman'),
(30,'Poland'),
(31,'Qatar'),
(32,'Russia'),
(33,'South Africa'),
(34,'Switzerland'),
(35,'Syria'),
(36,'Thailand'),
(37,'United States'),
(38,'Uganda'),
(39,'Vietnam'),
(40,'Yemen'),
(41,'Zimbabwe')

SET IDENTITY_INSERT country OFF;


SET IDENTITY_INSERT state ON 
GO 
INSERT INTO state(state_id, country_name, state_name)
VALUES 


(1,1,'Badakhshan'),
(2,1,'Badghis'),
(3,1,'Baghlan'),
(4,2,'Berat'),
(5,2,'Diber'),
(6,2,'Durres'),
(7,3,'Adrar'),
(8,3,'Blida'),
(9,3,'Tipaza'),
(10,4,'Canillo'),
(11,4,'Ordino'),
(12,5,'Tasmania'),
(13,5,'Victoria'),
(14,6,'Burgenland'),
(15,6,'Tirol'),
(16,7,'Bahia'),
(17,7,'Roraima'),
(18,8,'Dhaka'),
(19,9,'Jilin'),
(20,10,'Atacama'),
(21,11,'Capital'),
(22,12,'Suhaj'),
(23,13,'Tigray'),
(24,14,'Auvergne'),
(25,15,'South Savo'),
(26,16,'Bremen'),
(27,17,'Ajaria'),
(28,18,'Crete'),
(29,19,'Eastern District'),
(30,20,'BaranyaMegye'),
(31,21,'Kerala'),
(32,22,'Cavan'),
(33,23,'Akita'),
(34,24,'Hawalli'),
(35,25,'Central'),
(36,26,'Diekirch'),
(37,27,'Colima'),
(38,28,'Eastern'),
(39,29,'Dhofar'),
(40,30,'Lodzkie'),
(41,31,'Al Khawr'),
(42,32,'Altay'),
(43,33,'Free State'),
(44,34,'Bern'),
(45,35,'Idlib'),
(46,36,'Chai Nat'),
(47,37,'Alaska'),
(48,37,'Texas'),
(49,37,'New York'),
(50,37,'California'),
(51,38,'Abim'),
(52,39,'Bac Can'),
(53,40,'Ataq'),
(54,41,'Bulawayo'),
(56,37,'New Jersey')

SET IDENTITY_INSERT state OFF;

SELECT * FROM state

SET IDENTITY_INSERT city ON 
GO 
INSERT INTO city(city_id, city_name, state_id)
VALUES 

(1,1,'Jurm'),
(2,2,'Abbakhsh'),
(3,3,'Baglan'),
(4,4,'Berat'),
(5,5,'Burrel'),
(6,6,'Durres'),
(7,7,'Algiers'),
(8,8,'Amsthas'),
(9,9,'Aboucha'),
(10,10,'Canillo'),
(11,11,'Ordino'),
(12,12,'Hobart'),
(13,13,'Melbourne'),
(14,14,'Eisenstadt'),
(15,47,'Anchorage'),
(16,47,'Fairbanks'),
(17,47,'College'),
(18,47,'Kodiak'),
(19,47,'Meadow Lakes'),
(20,48,'Houston'),
(21,48,'Dallas'),
(22,48,'Austin'),
(24,48,'Fort Worth'),
(25,49,'New York'),
(26,49,'Buffalo'),
(27,49,'Rochester'),
(28,49,'Syracuse'),
(29,49,'Albany'),
(30,50,'Los Angeles'),
(31,50,'San Diego'),
(32,50,'San Francisco'),
(33,50,'Oakland'),
(34,50,'Sacremento'),
(35,56,'Newark')

SET IDENTITY_INSERT city OFF;

SELECT * FROM city 

SET IDENTITY_INSERT designation ON 
GO 
INSERT INTO designation(desig_id, desig_name, desig_description)
VALUES 


(1,'Project Manager','Project Manager'),
(2,'Software Developer','Software Developer'),
(3,'Team Leader','Team Leader'),
(4,'Business Analyst','Business Analyst'),
(5,'Design Engineer','Design Engineer'),
(6,'Tech Lead','Tech Lead')

SET IDENTITY_INSERT designation OFF;

SELECT * FROM designation

SET IDENTITY_INSERT salary ON
INSERT INTO salary(salary_id, emp_id, emp_salary_change_year, emp_salary)
VALUES

(2,1,36535,65000),
(3,2,38403,75000),
(4,3,40181,85000),
(5,4,38718,35000),
(6,5,38718,40000),
(7,6,40544,90000),
(8,7,38635,28000),
(9,8,39701,56000),
(10,9,36686,105000),
(11,10,37438,185000),
(12,11,36892,78500),
(13,12,37257,89200),
(14,5,37622,115500),
(15,5,38353,156000),
(16,6,38718,67000),
(17,6,39814,76000)

SET IDENTITY_INSERT salary OFF;

DROP TABLE salary

SELECT * FROM salary


















































