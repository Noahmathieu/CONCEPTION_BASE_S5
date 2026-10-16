
## Etape 1
SELECT nom as Plat, prix FROM PLAT

## Etape 2

SELECT c.nom as Categorie,COUNT(p.id_categorie) FROM PLAT p RIGHT JOIN CATEGORIE c ON p.id_categorie = c.id_categorie group by c.id_categorie;