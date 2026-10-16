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

Piege->"On insert pas categorie(VARCHAR) dans le PLat parce que a chaque fois qu' on va ajouter des plats alors l' utilisateur de
l' application devrait inserer manuellement le nom du categorie alors que si on ajoute une faute de frappe ou quelques erreurs syntaxiques alors tout l' application est errone"