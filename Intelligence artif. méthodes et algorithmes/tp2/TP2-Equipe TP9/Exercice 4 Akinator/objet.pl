ask(appareil_electromenager, X):- format('~w est un appareil electromenager ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(appareil_electronique, X):- format('~w est un appareil electronique ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(cuisine, X):- format('~w se trouve dans la cuisine ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(hygiene, X):- format('~w est utilisé pour hygiene ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(divers, X):- format('~w est un autre objet ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(objets_portes, X):- format('~w est un objet porté par une personne ? ', [X]), nl, read(Reponse), Reponse = 'oui'.

ask(aspirateur, X):- format('~w est utilisé pour netoyer le sol automatiquement ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(four, X):- format('~w son principe de fonctionnement est basé sur les ondes electromagnetiques ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(cuisiniere, X):- format('~w est utilisé pour préparer le pizza ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(cafetiere, X):- format('~w est utilisé pour préparer le café ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(grille_pain, X):- format('~w est utilisé pour grillerle pain ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(ordinateur, X):- format('~w est utilisé pour faire des calculs ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(telephone, X):- format('~w est utilisé pour appeller quelqu un ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(fourchette, X):- format('~w est utilisé pour manger les sbaghetti ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(assiette, X):- format('~w est utilisé pour manger ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(table, X):- format('~w est un type de meuble plane et horizontale ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(casserole, X):- format('~w est utilisé pour cuisinier ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(balai, X):- format('~w est utilisé pour netoyer le sol manuelement ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(shampooing, X):- format('~w est un produit cosmétique présenté généralement sous forme de liquide ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(detergent_a_vaissaille, X):- format('~w est un composé chimique capable d enlever les salissures ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(cactus, X):- format('~w est une plante ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(lit, X):- format('~w est un meuble utilisé principalement pour dormir ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(piano, X):- format('~w est utilisé pour jouer la musique ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(lampe, X):- format('~w est une source de lumière ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(papier, X):- format('~w est utilisé pour ecrire ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(cle, X):- format('~w est utilisé pour ouvrir la porte ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(portefeuille, X):- format('~w est un accessoire de la taille d une poche utilise pour ranger son argent ? ', [X]), nl, read(Reponse), Reponse = 'oui'.
ask(sac_a_dos, X):- format('~w est un espace de stockage que l on transporte sur son dos ? ', [X]), nl, read(Reponse), Reponse = 'oui'.

objet(X):- findall(X, appareil_electromenager(X), Y), length(Y, 1);
		   findall(X, appareil_electronique(X), Y), length(Y, 1);
		   findall(X, cuisine(X), Y), length(Y, 1);
		   findall(X, hygiene(X), Y), length(Y, 1);
		   findall(X, divers(X), Y), length(Y, 1);
		   findall(X, objets_portes(X), Y), length(Y, 1).

objet(X):- ask(appareil_electromenager, X), appareil_electromenager_child(X).
objet(X):- ask(appareil_electronique, X), appareil_electronique_child(X).
objet(X):- ask(cuisine, X), cuisine_child(X).
objet(X):- ask(hygiene, X), hygiene_child(X).
objet(X):- ask(divers, X), divers_child(X).
objet(X):- ask(objets_portes,X), objets_portes_child(X).


appareil_electromenager_child(X):- ask(aspirateur, X), appareil_electromenager1(X), appareil_electromenager(X).
appareil_electromenager_child(X):- ask(four, X), appareil_electromenager2(X), appareil_electromenager(X).
appareil_electromenager_child(X):- ask(cuisiniere, X), appareil_electromenager3(X), appareil_electromenager(X).
appareil_electromenager_child(X):- ask(cafetiere, X), appareil_electromenager4(X), appareil_electromenager(X).
appareil_electromenager_child(X):- ask(grille_pain, X), appareil_electromenager5(X), appareil_electromenager(X).

appareil_electronique_child(X):- ask(ordinateur, X), appareil_electronique1(X), appareil_electronique(X).
appareil_electronique_child(X):- ask(telephone, X), appareil_electronique2(X), appareil_electronique(X).

cuisine_child(X):- ask(fourchette, X), cuisine1(X), cuisine(X).
cuisine_child(X):- ask(assiette, X), cuisine2(X), cuisine(X).
cuisine_child(X):- ask(table, X), cuisine3(X), cuisine(X).
cuisine_child(X):- ask(casserole, X), cuisine4(X), cuisine(X).

hygiene_child(X):- ask(balai, X), hygiene1(X), hygiene(X).
hygiene_child(X):- ask(shampooing, X), hygiene2(X), hygiene(X).
hygiene_child(X):- ask(detergent_a_vaissaille, X), hygiene3(X), hygiene(X).

divers_child(X):- ask(cactus, X), divers1(X), divers(X).
divers_child(X):- ask(lit, X), divers2(X), divers(X).
divers_child(X):- ask(piano, X), divers3(X), divers(X).
divers_child(X):- ask(lampe, X), divers4(X), divers(X).
divers_child(X):- ask(papier, X), divers5(X), divers(X).

objets_portes_child(X):- ask(cle, X), objets_portes1(X), objets_portes(X).
objets_portes_child(X):- ask(portefeuille, X), objets_portes2(X), objets_portes(X).
objets_portes_child(X):- ask(sac_a_dos, X), objets_portes3(X), objets_portes(X).


appareil_electromenager(aspirateur).
appareil_electromenager(four).
appareil_electromenager(cuisiniere).
appareil_electromenager(cafetiere).
appareil_electromenager(grille_pain).

appareil_electronique(ordinateur).
appareil_electronique(telephone).

cuisine(fourchette).
cuisine(assiette).
cuisine(table).
cuisine(casserole).

hygiene(balai).
hygiene(shampooing).
hygiene(detergent_a_vaissaille).

divers(cactus).
divers(lit).
divers(piano).
divers(lampe).
divers(papier).

objets_portes(cle).
objets_portes(portefeuille).
objets_portes(sac_a_dos).



appareil_electromenager1(aspirateur).
appareil_electromenager2(four).
appareil_electromenage3(cuisiniere).
appareil_electromenager4(cafetiere).
appareil_electromenager5(grille_pain).

appareil_electronique1(ordinateur).
appareil_electronique2(telephone).

cuisine1(fourchette).
cuisine2(assiette).
cuisine3(table).
cuisine4(casserole).

hygiene1(balai).
hygiene2(shampooing).
hygiene3(detergent_a_vaissaille).

divers1(cactus).
divers2(lit).
divers3(piano).
divers4(lampe).
divers5(papier).

objets_portes1(cle).
objets_portes2(portefeuille).
objets_portes3(sac_a_dos).