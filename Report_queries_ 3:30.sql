-- Find the names and injuries of all the Bi-Ped animals who are injured.
SELECT a.animal_name Animal, q.injury Inquiry 
FROM ANIMAL a, QUARANTINE q, EXHIBIT e 
WHERE a.id = q.animal_id and a.exhibit=e.name and e.name='Bi-Peds';

-- Find the names of all the employees borrowing equipment and list all those equipment
SELECT s.staff_name Name, eq.type Equipment 
FROM STAFF s, EQUIPMENT eq 
WHERE s.staff_id = eq.employee_id;

-- Find the names of all the employees and the names and years of all the events they’ve attended.
SELECT s.staff_name Name, es.event_name Event, es.year Event_Year
FROM STAFF s, EVENT_STAFF es
WHERE s.Staff_ID = es.Emp_ID;

-- Find the minimum salary from the staff members in the database.
SELECT min(s.Salary) , s.Staff_Name from staff s;

-- Find the average profits made from the events held in the Cryptozoo
SELECT avg(Profit) as Average_Profit from Events;

-- Find the names of all employees borrowing equipment and all employees managing an exhibit.
SELECT s.staff_name FROM STAFF s, EQUIPMENT eq WHERE s.staff_id = eq.employee_id
UNION SELECT s.staff_name FROM staff s, exhibit ex WHERE s.staff_id = ex.manager_id;

-- Find the total number of events recorded by the Cryptozoo.
select count(name) Number_of_Events from EVENTS;

-- Finds the areas of the Cryptozoo where there is either both equipment and a service, or at least an exhibit.
SELECT DISTINCT l.location
FROM LOCATION l 
WHERE l.location IN (
	select l.location
	from location l, service s, equipment eq
	where l.location=s.location and l.location=eq.location)
OR l.location IN (
	SELECT ex.location
	FROM location l, exhibit ex
	WHERE l.location=ex.location);

-- Find the name, type of cryptids, and the veterinarians Iin charge of animals presently quarantined.
SELECT a.animal_name Name, sp.common_name Species, s.staff_name as Vet
FROM SPECIES sp, ANIMAL a, STAFF s, QUARANTINE q
WHERE sp.species_name = a.species_name AND a.id = q.animal_id AND s.staff_id = q.assigned_vet;

-- Find the names of all the cryptids, along with the exhibit they’re in and the area of the Cryptozoo that their exhibit is in.
SELECT a.animal_name, ex.name, ex.location
from ANIMAL a
INNER JOIN EXHIBIT ex ON a.exhibit = ex.name;

-- Find all the cryptids whose personal name starts with M, and the area of the zoo their exhibit is in. 
SELECT a.animal_name Name, ex.location Area
FROM ANIMAL a, EXHIBIT ex
WHERE a.animal_name LIKE 'M%' AND a.exhibit = ex.name;

-- Find the personal names of all the cryptids in quarantine, and name their injury, if they have.
SELECT a.animal_name Name, q.injury Injury
FROM ANIMAL a
LEFT JOIN QUARANTINE q ON a.id = q.animal_id;

-- Find the event that cost the most.
SELECT Cost, Name, Year
FROM EVENTS
WHERE Cost IN (
	SELECT max(cost)
    FROM EVENTS);
    
-- Find all the cryptid common names from the Americas and the managing staff responsible for them.
SELECT sp.common_name Common_Name, ex.location Continent, Staff_Name Manager
FROM SPECIES sp, EXHIBIT ex, ANIMAL a, STAFF s
WHERE a.Exhibit = ex.Name AND ex.Location LIKE '%America%' AND ex.Manager_ID = s.Staff_ID;

-- Find the event that cost the least.
SELECT Cost, Name, Year
FROM EVENTS
WHERE Cost IN (
	SELECT min(cost) FROM EVENTS);
    
-- Find the complete species information for every animal.
SELECT Common_Name, s.Species_Name, s.Is_Endangered, a.Animal_Name, a.ID, a.Exhibit 
FROM SPECIES s, ANIMAL a
WHERE a.Species_Name = a.Species_Name;

-- Find the number of events that occurred in a year in years  where more than one event occured.
 SELECT COUNT(Name) AS Number_of_Events, Year 
 FROM EVENTS GROUP BY Year HAVING COUNT(NAME) >1;
 
-- Find the number of staff members at each clearance level.
 SELECT Clearance, COUNT(Staff_ID) Staff_Num 
 FROM STAFF GROUP BY Clearance;
 
-- Find the managers of exhibits and order them by how many staff members they manage.
SELECT Staff_Name AS Manager, Staff_ID AS ID, Name AS Exhibit, Staff_Num 
FROM STAFF, EXHIBIT 
WHERE Manager_ID = Staff_ID ORDER BY Staff_Num ASC;

-- Find the average cost of  events.
SELECT AVG(Cost) AS Average_Cost FROM EVENTS;
