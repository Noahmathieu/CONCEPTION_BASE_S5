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
