USE CRYPTOZOO;
CREATE TABLE SERVICE (
	Service_Name VARCHAR(25) NOT NULL,
	Is_Commercial BOOLEAN,
	Num_Employed INT,
	Location VARCHAR(25), 
	PRIMARY KEY(Service_Name),
	FOREIGN KEY(Location) REFERENCES LOCATION(Location)
		ON UPDATE CASCADE ON DELETE SET NULL); -- If a location is deleted aLL THE ATTACHED SERVICES ARE SET TO NULL Locations.

CREATE TABLE EQUIPMENT (
	Name VARCHAR(15) NOT NULL,
	Location VARCHAR(25),
	Service VARCHAR(25) NOT NULL,
	Equipment_ID CHAR(9) NOT NULL,
	Employee_ID CHAR(9),
	PRIMARY KEY(Equipment_ID),
	FOREIGN KEY(Location) REFERENCES LOCATION(Location)
		ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(Service) REFERENCES SERVICE(Service_Name)
		ON UPDATE CASCADE ON DELETE CASCADE, -- If a serviceis deleted, all the equipment associated with it are deleteed as well.
	FOREIGN KEY(Employee_ID) REFERENCES STAFF(Staff_ID)
		ON UPDATE CASCADE ON DELETE SET NULL); -- If an employee is deletd, their equipment is set to null.
