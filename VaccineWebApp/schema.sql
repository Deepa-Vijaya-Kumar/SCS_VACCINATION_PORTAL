BEGIN;


DROP TABLE IF EXISTS state;
CREATE TABLE state (
    id              INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    state_name            VARCHAR(50)
);


DROP TABLE IF EXISTS district;
CREATE TABLE district (
    id              INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    district_name            VARCHAR(100),
    state_id   INTEGER,
    FOREIGN KEY(state_id) REFERENCES state(id)
);

DROP TABLE IF EXISTS vaccine;
CREATE TABLE vaccine (
    id              INTEGER,
    vaccine_name            VARCHAR(100),
    district_id   INTEGER,
    today_slot          INTEGER,
    tomorrow_slot          INTEGER,
    PRIMARY KEY(vaccine_name,district_id),
    FOREIGN KEY(district_id) REFERENCES district(id)
);


DROP TABLE IF EXISTS vaccine_status;
CREATE TABLE vaccine_status (
    health_id        INTEGER,
    dose1_date       DATE,
    dose2_date          DATE,
    registration_token  VARCHAR(7),
    vaccination_status  VARCHAR(5),
    vaccine_name VARCHAR(20),
    PRIMARY KEY(health_id)
);

COMMIT;


INSERT INTO state (id, state_name) VALUES (1, "Hesse");
INSERT INTO state (id, state_name) VALUES (2, "Rhineland-Palatinate");
INSERT INTO state (id, state_name) VALUES (3, "Bavaria");
INSERT INTO state (id, state_name) VALUES (4, "Bremen");


INSERT INTO district (id, district_name, state_id) VALUES (1, "Frankfurt am Main -- Frankfurt Messe", 1);
INSERT INTO district (id, district_name, state_id) VALUES (2, "Wiesbaden-- Messe Wiesbaden", 1);
INSERT INTO district (id, district_name, state_id) VALUES (3, "Kassel-- Corona- Impfzentrum Kassel", 1);
INSERT INTO district (id, district_name, state_id) VALUES (4, "Marburg--Marburg Messe", 1);
INSERT INTO district (id, district_name, state_id) VALUES (5, "Fulda--Corona Impfzentrum Des Landkreises Fulda ", 1);
INSERT INTO district (id, district_name, state_id) VALUES (6, "Darmstadt-- Darmstadtium Congress Centre", 1);
INSERT INTO district (id, district_name, state_id) VALUES (7, "Mainz--Hechtsheim Messe", 2);
INSERT INTO district (id, district_name, state_id) VALUES (8, "Landau--University of Koblenz", 2);
INSERT INTO district (id, district_name, state_id) VALUES (9, "Alzey--Impfzentrum Alzey", 2);
INSERT INTO district (id, district_name, state_id) VALUES (10, "Trier--Impfzentrum Rheinland-Pfalz", 2);
INSERT INTO district (id, district_name, state_id) VALUES (11, "Upper Bavaria--Ainring", 3);
INSERT INTO district (id, district_name, state_id) VALUES (12, "Lower Bavaria--Deggendorf", 3);
INSERT INTO district (id, district_name, state_id) VALUES (13, "Upper Franconia--Bamberg", 3);
INSERT INTO district (id, district_name, state_id) VALUES (14, "Middle Franconia--Bad Windsheim", 3);
INSERT INTO district (id, district_name, state_id) VALUES (15, "Lower Franconia--Bad Neustadt", 3);
INSERT INTO district (id, district_name, state_id) VALUES (16, "Swabia--Augsburg", 3);
INSERT INTO district (id, district_name, state_id) VALUES (17, "Bahnhofsvorstadt--Vaccination centre Bremen Central", 4);
INSERT INTO district (id, district_name, state_id) VALUES (18, "Findorff-Bürgerweide--Vaccination centre Bremen Central", 4);
INSERT INTO district (id, district_name, state_id) VALUES (19, "Lehe--Stadthalle Bremerhaven Veranstaltungs- und Messe GmbH", 4);
INSERT INTO district (id, district_name, state_id) VALUES (20, "Aumund-Hammersbeck--Vaccination centre Bremen-Vegesack", 4);


INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (1, "BioNTech-Pfizer",1,0,20);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (2, "AstraZeneca",1,31,30);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (3, "Johnson & Johnson",1,30,40);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (4, "Moderna",1,40,50);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (5, "BioNTech-Pfizer",2,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (6, "AstraZeneca",2,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (7, "Johnson & Johnson",2,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (8, "Moderna",2,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (9, "BioNTech-Pfizer",3,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (10, "AstraZeneca",3,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (11, "Johnson & Johnson",3,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (12, "Moderna",3,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (13, "BioNTech-Pfizer",4,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (14, "AstraZeneca",4,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (15, "Johnson & Johnson",4,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (16, "Moderna",4,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (17, "BioNTech-Pfizer",5,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (18, "AstraZeneca",5,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (19, "Johnson & Johnson",5,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (20, "Moderna",5,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (21, "BioNTech-Pfizer",6,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (22, "AstraZeneca",6,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (23, "Johnson & Johnson",6,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (24, "Moderna",6,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (25, "BioNTech-Pfizer",7,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (26, "AstraZeneca",7,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (27, "Johnson & Johnson",7,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (28, "Moderna",7,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (29, "BioNTech-Pfizer",8,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (30, "AstraZeneca",8,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (31, "Johnson & Johnson",8,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (32, "Moderna",8,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (33, "BioNTech-Pfizer",9,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (34, "AstraZeneca",9,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (35, "Johnson & Johnson",9,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (36, "Moderna",9,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (37, "BioNTech-Pfizer",10,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (38, "AstraZeneca",10,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (39, "Johnson & Johnson",10,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (40, "Moderna",10,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (41, "BioNTech-Pfizer",11,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (42, "AstraZeneca",11,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (43, "Johnson & Johnson",11,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (44, "Moderna",11,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (45, "BioNTech-Pfizer",12,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (46, "AstraZeneca",12,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (47, "Johnson & Johnson",12,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (48, "Moderna",12,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",13,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",13,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",13,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",13,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",14,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",14,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",14,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",14,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",15,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",15,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",15,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",15,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",16,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",16,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",16,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",16,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",17,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",17,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",17,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",17,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",18,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",18,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",18,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",18,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",19,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",19,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",19,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",19,40,90);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (49, "BioNTech-Pfizer",20,10,60);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (50, "AstraZeneca",20,20,70);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (51, "Johnson & Johnson",20,30,80);
INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (52, "Moderna",20,40,90);