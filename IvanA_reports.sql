
-- 1.List all contracted staff members with a salary > $25,000
SELECT Staff_Name, Salary
FROM STAFF s
WHERE s.salary > 25000 AND s.Is_Contracted = TRUE;

-- 2.List all locations that can house more than 70 animals
SELECT Location, Max_Occupancy 
FROM LOCATION l
WHERE l.Max_Occupancy > 70;

-- 3.List all staff memebers with an Id number ending with a 9
SELECT Staff_Name, Staff_ID
FROM STAFF
WHERE Staff_ID LIKE "%9";

-- 4. List the name and salary of all staff members managed by Eisner
SELECT s.Staff_Name, s.Salary
FROM (STAFF s JOIN WORK_TEAM w ON s.Staff_ID = w.Staff_ID)
WHERE Mgr_ID = (
	SELECT Staff_ID FROM STAFF WHERE Staff_Name = 'Eisner'
    );

-- 5. Describe all the equipment currently being used and the staff member who responsible for it
SELECT s.Staff_Name Employee, e.Type Equipment
FROM STAFF s, EQUIPMENT e, IN_USE i
WHERE s.Staff_ID = i.Staff_ID AND e.Equipment_ID = i.Equipment_ID;

-- 6. List all the employees who earn less than the average salary, in descending order of their salary
SELECT s.Staff_Name, s.Salary
FROM STAFF s 
WHERE s.Salary < (SELECT AVG(Salary) FROM STAFF) ORDER BY s.Salary DESC;

-- 7. List all staff members earning more than Sejic
select s.Staff_Name, s.Salary
from STAFF s
where s.Salary > (select s.Salary from STAFF s where s.Staff_Name = 'Sejic');

-- List all locations without occupancy limit
SELECT l.Location
FROM LOCATION l
WHERE Max_Occupancy IS NULL;

-- List all contracted staff members earning more than the average salary
SELECT s.Staff_Name, s.Salary
FROM STAFF s 
WHERE s.Salary > (SELECT AVG(Salary) FROM STAFF) AND Is_Contracted = TRUE;

-- Which staff member earns the highest salary
SELECT Staff_Name, Salary
FROM  STAFF s
WHERE Salary = (SELECT MAX(Salary) FROM STAFF);