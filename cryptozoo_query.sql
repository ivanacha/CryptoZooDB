CREATE DATABASE CRYPTOZOO;
USE CRYPTOZOO;

CREATE TABLE LOCATION(
	Location VARCHAR(25) NOT NULL,
	Num_Exhibits INT,
	Max_Occupancy INT,
	PRIMARY KEY(Location));

CREATE TABLE STAFF(
	Staff_Name VARCHAR(25),
	Staff_ID CHAR(9) NOT NULL,
	Clearance BOOLEAN,
	Is_Contracted BOOLEAN,
	Salary INT,
	PRIMARY KEY(Staff_ID));
    
CREATE TABLE EXHIBIT(
	Name VARCHAR(15) NOT NULL,
	Staff_Num INT,
	Manager_ID CHAR(9),
	Animal_Num INT,
	Clearance BOOLEAN,
	Location VARCHAR(25) NOT NULL,
	PRIMARY KEY(Name, Location),
	FOREIGN KEY(Manager_ID) REFERENCES STAFF(Staff_ID)
		ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(Location) REFERENCES LOCATION(Location)
		ON UPDATE CASCADE ON DELETE CASCADE);


CREATE TABLE SPECIES(
	Common_Name VARCHAR(30),
	Species_Name VARCHAR(30) NOT NULL,
	Is_Endangered BOOLEAN,
	PRIMARY KEY(Species_Name));

CREATE TABLE ANIMAL(
	Animal_Name VARCHAR(25),
	ID CHAR(9) NOT NULL,
	Exhibit VARCHAR(15),
	Species_Name VARCHAR(30) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(Species_Name) REFERENCES SPECIES(Species_Name)
		ON UPDATE CASCADE ON DELETE NO ACTION); -- After populating this table, see if chosing either RESTRICT or NO ACTION makes a difference.

CREATE TABLE SERVICE
(Service_Name VARCHAR(25) NOT NULL,
Is_Commercial BOOLEAN,
Num_Employed INT,
Location VARCHAR(25) NOT NULL, 
PRIMARY KEY(Service_Name),
FOREIGN KEY(Location) REFERENCES LOCATION(Location)
ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE EQUIPMENT 
(Type VARCHAR(30) NOT NULL,
Location VARCHAR(25) NOT NULL,
Service VARCHAR(25),
Equipment_ID CHAR(9) NOT NULL,
Employee_ID CHAR(9),
PRIMARY KEY(Equipment_ID),
FOREIGN KEY(Location) REFERENCES LOCATION(Location)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(Service) REFERENCES SERVICE(Service_Name)
ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY(Employee_ID) REFERENCES STAFF(Staff_ID)
ON UPDATE CASCADE ON DELETE SET NULL);

CREATE TABLE QUARANTINE
(Animal_ID CHAR(9) NOT NULL,
Injury VARCHAR(25),
Assigned_Vet CHAR(9),
Projected_Release_Date DATE,
PRIMARY KEY(Animal_ID),
FOREIGN KEY(Animal_ID) REFERENCES ANIMAL(ID)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(Assigned_Vet) REFERENCES STAFF(Staff_ID)
ON UPDATE CASCADE ON DELETE SET NULL);


CREATE TABLE EVENTS
(Name VARCHAR(50) NOT NULL,
Year INT,
Event_Start DATE,
Event_end DATE,
Description VARCHAR(140),
Profit INT NOT NULL,
Cost INT NOT NULL,
PRIMARY KEY (Name, Year));


CREATE TABLE EVENT_STAFF
(Emp_ID CHAR(9) NOT NULL,
Event_Name VARCHAR(30) NOT NULL,
Year CHAR(4),
Hours DECIMAL(10, 2),
PRIMARY KEY(Emp_ID, Event_Name),
FOREIGN KEY(Emp_ID) REFERENCES STAFF(Staff_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(Event_Name) REFERENCES EVENTS(Name)
ON UPDATE CASCADE ON DELETE CASCADE);