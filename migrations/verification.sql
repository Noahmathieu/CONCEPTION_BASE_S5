
## Etape 1
SELECT nom as Plat, prix FROM PLAT

## Etape 2

SELECT c.nom as Categorie,COUNT(p.id_categorie) FROM PLAT p RIGHT JOIN CATEGORIE c ON p.id_categorie = c.id_categorie group by c.id_categorie;

## Etape 3
SELECT coc.id_commande,SUM(coc.quantite*p.prix) FROM COMMANDES co JOIN COMMANDES_DETAILS coc ON co.id_commande = coc.id_commande JOIN PLAT p ON p.id_plat = coc.id_plat GROUP BY coc.id_commande;

## Etape 4
SELECT cl.nom,co.id_commande ,CASE WHEN cl.habitue THEN 'Client Habituel' ELSE 'Client de passage' END AS type_client
FROM COMMANDES co JOIN COMMANDES_DETAILS coc ON co.id_commande = coc.id_commande LEFT JOIN CLIENT cl ON cl.id_client = co.id_client;

## Etape 5
SELECT serv.nom AS nomServeur, COUNT(com.id_commande) as NombreCommande , SUM((prix*quantite)) FROM COMMANDES com JOIN SERVEUR serv ON com.id_serveur=serv.id_serveur JOIN TABLES tab ON com.id_tables = tab.id_tables JOIN
commandes_details cod ON cod.id_commande = com.id_commande JOIN PLAT p ON p.id_plat=cod.id_plat GROUP BY serv.id_serveur 