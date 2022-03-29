-- location
INSERT INTO  LOCATION VALUES ("North America", 3, 15);
INSERT INTO  LOCATION VALUES("Asia",3, 20);
INSERT INTO  LOCATION VALUES("Europe", 3, 18);
INSERT INTO  LOCATION VALUES("Entrance", 0 , 0);
-- staff
INSERT INTO STAFF VALUES("Salvador",912914404,1,1,15000);
INSERT INTO STAFF VALUES("Lazarus", 912904770,1,0, 20000);
INSERT INTO STAFF VALUES("Goldsmith",912904889,1,0,17000);
-- exhibit
INSERT INTO EXHIBIT VALUES("Bi-Peds",3,912914404,3,1,"North America");
INSERT INTO EXHIBIT VALUES("Winged Giants",5,912904889,6,1,"Asia");
-- species
INSERT INTO  SPECIES VALUES("Bigfoot", "Bipedius Harriest", 1);
INSERT INTO  SPECIES VALUES("Mothman", "Flightius Motheus",0);
INSERT INTO  SPECIES VALUES("Chupacabra", "Vampiricus Felinoness", 0);
-- animal
INSERT INTO ANIMAL VALUES("Max", 01295, "Bi-peds", "Bipedius Harriest");
INSERT INTO ANIMAL VALUES("Buddy", 75688, "Winged Giants", "Flightius Motheus");
INSERT INTO ANIMAL VALUES("Milo",79863,"Quadrupeds", "Vampiricus Felinoness");
-- service
INSERT INTO SERVICE VALUES("Cleaning", 1, 20, "Entrance");
INSERT INTO SERVICE VALUES("Construction", 0, 30,"North America");
INSERT INTO SERVICE VALUES("Cashier", 0, 15,"Entrance");
-- equipment
INSERT INTO EQUIPMENT VALUES("Pressure Washer", "North America", "Cleaning", 331480777,912914404);
INSERT INTO EQUIPMENT VALUES("Drill", "Europe", "Construction", 441506111, 912904889);
INSERT INTO EQUIPMENT VALUES("Credit Card Machine","Entrance", "Cashier", 685154625, 912904770);
-- quarantine
INSERT INTO QUARANTINE VALUES (01295,"Fractured Skull", 912904770,'2022-12-14');
INSERT INTO QUARANTINE VALUES (75688,"Lacerated Torso", 912904770,'2022-05-10');
--events
INSERT INTO EVENTS VALUES ("Birthday",2022,'2022-12-27','2022-12-31',"Tons of fun and festivities. This is a 21+ event.",1000,50000);
