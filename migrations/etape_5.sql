CREATE TABLE PLAT(
    id_plat SERIAL NOT NULL,
    nom varchar(255) NOT NULL,
    prix integer NOT NULL,
    PRIMARY KEY(id_plat)
);

INSERT INTO PLAT(nom, prix) values 
('Romazava',7000),
('Ravitoto sy hena kisoa',8000),
('Akoho sy voanio',8500),
('Mi sao',6000),
('Soupe Chinoise',5000),
('Mofo gasy(les 4)',1000),
('Ranon apango',500);

CREATE TABLE CATEGORIE(
    id_categorie SERIAL NOT NULL,
    nom varchar(255) NOT NULL,
    PRIMARY KEY(id_categorie)
);
INSERT INTO CATEGORIE(nom) values ('Plat Malagasy'),('Plat Chinois'),('Soupe'),('Dessert et gouter'),('Boisson'),('Patisserie');

ALTER TABLE PLAT ADD COLUMN id_categorie integer REFERENCES CATEGORIE(id_categorie) ON DELETE CASCADE;

UPDATE PLAT SET id_categorie = 1 where nom='Romazava';
UPDATE PLAT SET id_categorie = 1 where nom='Ravitoto sy hena kisoa';
UPDATE PLAT SET id_categorie = 1 where nom='Akoho sy voanio';
UPDATE  PLAT SET id_categorie = 2 where nom='Mi sao';
UPDATE  PLAT SET id_categorie = 3 where nom='Soupe Chinoise';
UPDATE  PLAT SET id_categorie = 4 where nom='Mofo gasy(les 4)';
UPDATE  PLAT SET id_categorie = 5 where nom='Ranon apango';


CREATE TABLE COMMANDES(
    id_commande SERIAL NOT NULL,
    date DATE,
    PRIMARY KEY(id_commande)
);
CREATE TABLE COMMANDES_DETAILS(
    id_commande integer NOT NULL,
    id_plat integer NOT NULL,
    quantite integer NOT NULL,
    FOREIGN KEY (id_plat) REFERENCES PLAT(id_plat) ON DELETE CASCADE,
    FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande) ON DELETE CASCADE
);

INSERT INTO COMMANDES(date) values ('2026-10-02');
INSERT INTO COMMANDES(date) values ('2026-10-03');

INSERT INTO COMMANDES_DETAILS(id_commande, id_plat, quantite) values (1,1,2),
(1,2,1),
(2,3,3);


CREATE TABLE CLIENT(
    id_client SERIAL NOT NULL,
    nom VARCHAR(100),
    habitue BOOLEAN,
    PRIMARY KEY(id_client)
);

ALTER TABLE COMMANDES ADD COLUMN id_client integer REFERENCES CLIENT(id_client) on delete cascade;

INSERT INTO CLIENT(nom, habitue) values ('Noah', true), ('Mathieu', false);

UPDATE COMMANDES SET id_client = 1 WHERE id_commande = 1;
UPDATE COMMANDES SET id_client = 2 WHERE id_commande = 2;
INSERT INTO COMMANDES(date) values ('2026-10-04');

INSERT INTO COMMANDES_DETAILS(id_commande, id_plat, quantite) values (3,1,1),
(3,2,2),
(3,3,1);


CREATE TABLE SERVEUR(
    id_serveur SERIAL NOT NULL,
    nom VARCHAR(100),
    PRIMARY KEY(id_serveur)
);
INSERT INTO SERVEUR(nom) values ('Njaka Rakoto'), ('Lalao Rasoa');

CREATE TABLE TABLES(
    id_tables SERIAL NOT NULL,
    nom VARCHAR(100),
    PRIMARY KEY(id_tables)
);
INSERT INTO TABLES(nom) values ('Table 1'), ('Table 2'), ('Table 3'), ('Table 4'), ('Table 5'), ('Table 6'), ('Table 7'), ('Table 8');

ALTER TABLE COMMANDES ADD COLUMN id_serveur integer REFERENCES SERVEUR(id_serveur) on delete cascade;
ALTER TABLE COMMANDES ADD COLUMN id_tables integer REFERENCES TABLES(id_tables) on delete cascade;

UPDATE COMMANDES SET id_serveur = 1 WHERE id_commande = 1;
UPDATE COMMANDES SET id_serveur = 2 WHERE id_commande = 2;

UPDATE COMMANDES SET id_tables = 5 WHERE id_commande = 1;

UPDATE COMMANDES SET id_tables = 8 WHERE id_commande = 2;
