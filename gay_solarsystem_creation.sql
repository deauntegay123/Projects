--Deaunte' Gay
--Solar System Project
--April 30, 2017

DROP TABLE COMET;
DROP TABLE ASTEROID;
DROP TABLE ASTEROID_BELT;
DROP TABLE MOON;
DROP TABLE PLANET;

Create Table Planet(
Planet_ID			numeric(6,0) not null,
Planet_name			varchar(20) not null,
planet_temp			varchar(255) null,
Planet_surface		varchar(255)  null,
Planet_color		varchar(50)  null,
Planet_AU			numeric(5,3) null,
Planet_rotation		varchar(50) null,
Planet_Description	varchar(255) null
Primary key			(Planet_ID)
);

Create Table Moon(
Moon_ID				numeric(5,0) not null,
Moon_name			varchar(50) not null,
planet_id			numeric(6,0) null,
Moon_AU				numeric(5,4) null,
Moon_surface		varchar(50) null,
Moon_rotation		varchar(50) null,
Moon_origin			varchar(255) null
Primary Key			(moon_ID)
Foreign Key			(planet_id) references planet(planet_id)
);

Create Table Asteroid_Belt(
Belt_ID				numeric(4,0) not null,
Belt_Name			varchar(15) not null,
Belt_AU				numeric(5,3) null,
Belt_Minerals		varchar(255) null,
Belt_thickness		numeric(3,0) null
Primary Key			(Belt_ID)
);

Create Table Asteroid(
Ast_ID				numeric(5,0) not null,
Ast_name			varchar(50) not null,
Ast_au				numeric(6,3) null,
belt_id				numeric(4,0) null,
planet_id			numeric(6,0) null,
Ast_satellites		varchar(255) null,
Ast_family			varchar(255) null
Primary Key			(Ast_ID)
Foreign Key			(belt_ID) references asteroid_belt(belt_id),
Foreign Key			(planet_ID) references planet(planet_ID)
);

Create Table Comet(
Comet_ID			numeric(5,0) not null,
Comet_name			varchar(255) not null,
Belt_ID				numeric(4,0) null,
Epoch				varchar(255) null, 
Aphelion			numeric(6,3) null,
Comet_period		varchar(50) null,
Comet_type			varchar(15) null
Primary Key			(Comet_ID)
Foreign Key			(belt_id) references asteroid_belt(belt_id)
);


INSERT INTO PLANET VALUES(247734,'Earth','68 degrees f', 'silicon, aluminum, iron', 'blue, white, green', 1, 365, 'Goldilocks planet. Perfect atmosphere.')
INSERT INTO PLANET VALUES(424848,'Jupiter','234 degrees f', 'water, metane, ammonia', 'orange, white',5.2, 4380, 'Home of the Great Red Spot. Named after Roman God Jupiter.')
INSERT INTO PLANET VALUES(498286,'Saturn','288 degrees f', 'methane, ammonia', 'pale gold', 9.6, 10585, 'Named after Roman god of agriculture. Ring system with 9 continuous rings.')
INSERT INTO PLANET VALUES(220984,'Neptune','-353 degrees f', 'helium, methane', 'pale blue', 30.1, 60225, ' Named after the roman god of the sea. 15 times the mass of Earth.')
INSERT INTO PLANET VALUES(233642,'Venus','864 degrees f', 'carbon dioxide, nitrogen', 'pale yellow', 0.723, 225, 'Named after the roman goddess of love. Has the densest atmosphere.')
INSERT INTO PLANET VALUES(628057,'Mercury','800 degrees f', 'iron, sulfur', 'gray', 0.39, 88, 'The core is molton. Named after the Roman Messenger to the gods')
INSERT INTO PLANET VALUES(101553,'Mars','-67 degrees f', 'magnesium, sodium, potassium, chlorine','red, brown', 1.524, 254040, 'Named the red planet due to iron oxide.')
INSERT INTO PLANET VALUES(484932,'Uranus','-357 degrees f', 'ammonia, methan, helium','pale blue', 19.2, 735840, ' Named after Greek god of the sky Ouranos. Axis is tilted sideways')


INSERT INTO MOON VALUES(43705, 'Europa', 424848, 0.0045, 'magnesium sulfate, sulfuric acid','85 hours', 'Zeus lover and mother of King Minos of Krete')
INSERT INTO MOON VALUES(79841, 'Titan', 498286, 0.0082, 'nitrogen, methane, liquid hydrocarbon',' 384 hours', 'Discovered by Christiaan Huygens') 
INSERT INTO MOON VALUES(13631, 'Triton', 220984, 0.0022, 'frozen nitrogen', '141 hours', 'Named after the Greek sea god Triton, son of Poseidon')
INSERT INTO MOON VALUES(83181, 'Titania', 484932, 0.0029, 'water ice, carbon dioxide', '209 hours', 'Named after Titania Daughter of the Titans')
INSERT INTO MOON VALUES(50629, 'Io', 424848, 4.2, ' silicate rock, sulfur dioxide', '42 hours', 'Named after Io the priestess of Hera and lover of Zeus')
INSERT INTO MOON VALUES(51020, 'Phobos', 101553, 0.0044, 'carbonaceous chondrites', '8 hours', 'Named after the Greek god Phobos, son of Ares')
INSERT INTO MOON VALUES(38980, 'Enceladus', 498286, 0.0015, 'water vapor, moleculor hydrogen, sodium, chloride', '33 hours', 'Named afte the giant Enceladus of Greek mythology')
INSERT INTO MOON VALUES(89032, 'Ganymede', 424848, 0.0072, 'iron, silicate rock, water ice', '172 hours', 'Named after Ganymede the cupbearer of Zeus')
INSERT INTO MOON VALUES(60675, 'Deimos', 101553, 0.0002, 'caronaceous material', '30 hours', 'In Greek mythology, Deimos is the twin brother of phobos and personified terror')
INSERT INTO MOON VALUES(12748, 'Moon', 247734, 0.0026, 'hardened lava', '27 hours', 'Has very dark spots on the surface named luna mare')


INSERT INTO Asteroid_Belt VALUES(3218, 'Main-Belt', 2.7, 'carbonaceous chondrite, silicate, metal', 1)
INSERT INTO Asteroid_Belt VALUES(6385, 'Kuiper Belt', 40, 'methane, ammonia, water', 10)



INSERT INTO ASTEROID VALUES(28698, '4 Vesta', 2.36, 3218, 424848, null,'Vesta')
INSERT INTO ASTEROID VALUES(52434, '90 Antiope', 3.15, 3218,424848, null, 'Themis')
INSERT INTO ASTEROID VALUES(50370, '243 Ida' , 2.86, 3218, 424848, 'Dactyl', 'Koronis')
INSERT INTO ASTEROID VALUES(92603, '90482 Orcus', 39.433, 6385, 220984, 'Vanth', 'Plutino')
INSERT INTO ASTEROID VALUES(89000, '(15760) 1992 QB1', 43.78, 6385, 220984, null, 'Cubewano')
INSERT INTO ASTEROID VALUES(68409, '45 Eugenia', 406.9, 3218, null, 'Petit-Prince, S/2004(45)1', null)
INSERT INTO ASTEROID VALUES(25578, '307261) 2002 MS4', 41.72, 6385, null, null, 'Cubewano')
INSERT INTO ASTEROID VALUES(92525, '130 Elektra', 3.13, 3218, null, '130 Elektra', null)
INSERT INTO ASTEROID VALUES(30826, '(55565) 2002 AW197', 47.28, 6385, null, null, 'Cubewano')
INSERT INTO ASTEROID VALUES(65495, '1313 Berna', 2.66, 3218, null, 'S/2004 (1313) 1', 'Eunomia')


INSERT INTO COMET VALUES(95467, '8P/Tuttle', 6385, 'January 15, 2008', 10.38, '13.6 julian years', 'HF')
INSERT INTO COMET VALUES(94049, '2P/Encke', 6385, 'September 22, 2006', 4.11, '3.3 julian years', 'JF')
INSERT INTO COMET VALUES(96683, '133P/Elst-Pizarro', 3218, 'January 13, 2016', 3.67, '5.62 years', 'MB')
INSERT INTO COMET VALUES(15089, '4P/Faye', 6385, 'January 1, 2008', 6.026, '7.55 julian years', 'JF')
INSERT INTO COMET VALUES(89918, '12P/Pons-Brooks', 6385, 'September 15, 1954', 33.468, '70.85 years', 'HF')
INSERT INTO COMET VALUES(73066,'313P/Gibbs', 3218, 'February 4, 2012', 3.130, '5.21 years', 'MB')
INSERT INTO COMET VALUES(33540,'311P/PanSTARRS', 3218, 'April 25, 2013', 2.441, '3.24 years', 'MB')
INSERT INTO COMET VALUES(81958,'16P/Brooks 2', 6385, 'May 14, 2008', 5.24, '6.14 julian years', 'HF')
INSERT INTO COMET VALUES(32045,'19P/Borrelly', 6385, 'September 8, 2001', 5.83,'6.8 julian years', 'JF')
INSERT INTO COMET VALUES(61945,'96P/Machholz 1', 6385, 'September 6, 2013', 5.944, '5.28 years', 'HF')




