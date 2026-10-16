# Etape 1
PLAT(**id_plat**, nom, prix)

# Etape 2
CATEGORIE (**id_categorie** , nom)
PLAT(**id_plat**, nom, prix,#id_categorie?)

# Etape 3
COMMANDES(**id_commande**,date)
COMMANDES_DETAILS(**id_commande**,*id_plat**,quantite)

# Etape 4
CLIENT(**id_client**,nom,habitue)
COMMANDES(**id_commande**,date,#id_client?)(modified)