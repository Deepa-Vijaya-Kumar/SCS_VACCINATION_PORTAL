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


INSERT INTO vaccine (id, vaccine_name,district_id,today_slot,tomorrow_slot) VALUES (1, "BioNTech-Pfizer",1,10,20);
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