--Deaunte' Gay
--Solar System Queries
--April 30, 2017


--1. A simple select of all data in a table. What objects are in the solar system?
SELECT		*
FROM		planet, moon, asteroid_belt, asteroid, comet;

--2. A simple select of a subset of attributes in a table. What are surfaces made of?
SELECT		 planet_name, planet_surface
FROM		planet;

--3. Results sorted in ascending. What moons are closest to their planets?
SELECT		*
FROM		Moon
ORDER BY	moon_au;

--4. Results sorted in descending. Where is the point of each comet where it is the furthest from the sun from farthest?
SELECT		*
FROM		Comet
ORDER By	Aphelion desc;

--5. Sorted results using two or more columns. What are the moons of each planet?
SELECT		p.planet_name, m.moon_name
FROM		planet p
Inner Join	moon m
on			p.planet_id = m.planet_id
Order By	planet_name;

--6. A calculated field that does not use a function. Make ever planet orbit the sun
ALTER TABLE Planet
ADD			orbits	varchar(15)	 not null	Default('Orbits the sun');

select * from planet;

--7. A string function. What is the core of the Solar System?
SELECT		right(orbits, 3) as Core
FROM		planet;

--8. A compound conditional that uses BETWEEN, AND, and OR. Which comets have an aphelion between 5 and 6 or come from the main belt?
SELECT		c.comet_name
FROM		comet c
Where		c.aphelion between 5 AND 6
OR			c.belt_ID = 3218;

--9. Group by and having clauses. What moons orbit Mars?
SELECT		m.moon_name
FROM		moon m
Group By	m.moon_name, m.planet_id
Having		m.planet_ID = 101553;

--10. Finding null values in an attribute of one of the tables. How many astroids do not have satellites?
SELECT		*
FROM		asteroid
Where		ast_satellites is null;

--11. The count function. How many asteroids orbit near a planet?
SELECT		 count(a.planet_id) as asteroids_orbiting_near_planet
FROM		asteroid a;

--12. The sum or average function. What is the average planet distance from the sun?
SELECT		AVG(planet_au) as Average_AU
FROM		planet;

--13. The min or max function. What is the max comet period
SELECT		max(comet_period) as MAX_PERIOD
FROM		comet;

--14. A single-value sub-query. What is the sum of every comet aphelion from the kuiper belt?
SELECT		SUM(c.aphelion) as kuiper_aphilion
FROM		comet c
Inner Join	asteroid_belt b
on			c.belt_ID = b.belt_ID
where		c.belt_iD = 6385;

--15. A multiple-value sub-query. Show the sum of all planets that have a moon orbitting them as well as a count of the moons that orbit planets.
SELECT		sum(p.planet_au) as planet_au_with_moons, count(m.moon_name) moons_with_planets
FROM		planet p
Inner Join	moon m
ON			p.planet_ID = m.planet_ID;

--16. The IN logic. Which asteroids come from the Cubewano family?
SELECT		ast_name
FROM		asteroid
WHERE		ast_family in ('Cubewano');

--17. The use of LIKE. Which moons were named after Greek mythology?
SELECT		moon_name
FROM		moon
Where		moon_origin like '%greek%';

--18. A natural join (i.e. inner join) of two tables. What is everything know about planets and the moons orbiting them?
SELECT		*
FROM		planet p
Inner Join	moon m
on			p.planet_id = m.planet_id;

--19 A left outer join of two tables. Show all planets and moons even if there are moons with no planets.
Select		*
FROM		planet p
Left Join	moon m
on			p.planet_id = m.planet_id;

--20 A right outer join of two tables. Show all planets and moons only if they are related. 
Select		*
FROM		planet p
Right Join	moon m
on			p.planet_id = m.planet_id;

--21. A full join of two tables. What are all moons and asteroids that share a planet, but also moons and asteroids that share neither. 
Select		*
FROM		moon m
Full Join	asteroid a
on			m.planet_id = a.planet_id;

--22.	A natural join (i.e. inner join) of three or more tables. What are all the asteroids and comets that share belts and do not?
SELECT		*
FROM		asteroid_belt b
Inner Join	asteroid a
On			b.belt_ID = a.belt_ID
Join		comet c
On			a.belt_ID = c.belt_ID;

--23.	A subquery (i.e. nested query). What planets have moons and also asteroids that have planets? Which asteroids, planets, and moons have neither?
SELECT		p.planet_name, m.moon_name, a.ast_name
From		planet p
 Left Join	moon m
ON			p.planet_id = m.planet_id
Left Join	asteroid a
ON			m.planet_id = a.planet_id
UNION ALL
SELECT		p.planet_name, m.moon_name, a.ast_name
From		planet p
Right Join	moon m
ON			p.planet_id = m.planet_id
Right Join	asteroid a
ON			m.planet_id = a.planet_id

--24. A self-join. Which planets have moons?
SELECT		p.planet_name
FROM		planet p
Inner Join	moon m
On			p.planet_Id = m.planet_Id;

--25. A union. What are the asteroids and moons in relation to Jupiter?
SELECT		moon_name
FROM		moon 
where		planet_id = 424848
UNION 
SELECT		ast_name
FROM		asteroid
where		planet_id = 424848;

--26. A union all. Combine all asteroids and comets together.
SELECT		ast_name
FROM		asteroid
UNION All
SELECT		comet_name
FROM		comet;


--27. A simple update query. Check to make sure no planets are past 40 au from the sun because that is unrealistic. Also change the moon's surface description
--to rocks because its description was to scientific.
ALTER Table	Planet
ADD CHECK	(planet_au<40);

UPDATE		moon
SET			moon_surface ='rocks'
WHERE		moon_id = 12748;

select *	from moon;

--28. An update query that uses a compound conditional. All asteroids that have no planet it orbits and satellite should have a satellite of 'unknown'.
UPDATE		asteroid 
SET			ast_satellites = 'unknown'
Where		ast_satellites is null
And			planet_id is null;

select * from asteroid;

--29. An update query to increase or decrease an amount in a numeric column. A scientist believes that a planet with an orbit of over 10000 days is too high.
--He believes this should be cut in half.
UPDATE		planet
SET			planet_rotation = (planet_rotation/2)
Where		planet_rotation > 10000;

select * from planet;

--30. One of the data conversion functions (TO_CHAR e.g.) What is the date of the epoch in datetime format?
SELECT		CONVERT(datetime, epoch) as EPOCH_TIME
FROM		comet;

--31. A DATE function. How many years has it been since the epoch of ever comet
SELECT		comet_name, DATEDIFF(year,epoch,'4/30/17') as then_until_now
FROM		comet;

--32. A concatenation. What is every planet name and description in on column?
SELECT		CONCAT(planet_name , ': ' , planet_description)
FROM		planet;

--33. An INTERSECT. What are the planets that have asteroids orbiting nearby. 
SELECT		planet_id
FROM		planet
INTERSECT
SELECT		planet_id
FROM		asteroid;

--34 An EXCEPT. What planets do not have moons?
SELECT		planet_id
FROM		planet
EXCEPT		
SELECT		planet_id
FROM		moon;



