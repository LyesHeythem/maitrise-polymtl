INSTALLER LE PROJET :
Vérifiez que vous avez NodeJs installé avec node –v
	Si vous ne l’avez pas, téléchargez-le de https://nodejs.org/en/download/

Allez dans le dossier client et lancez npm install

Allez dans le dossier server et lancez npm install

LANCER LE PROJET :
Avant de lancer le projet
	Assurez-vous que Postgres roule sur la machine
	Créez une base de données et lui ajouter un  utilisateur
	Créez la base de données TP5 à l’aide des scripts bdschema.sql qui permet de créer les différentes tables, data.sql
	qui permet de mettre des données dans la base de données et trigger.sql qui permet la création de la table « Archive »
	et du trigger qui permet de remplir cette archive
	Allez dans /server/app/services/database.service.ts et modifiez connectionConfig avec les bons paramètres de la BD TP5

Lancer le projet
	Allez dans /server et faites npm start
	Allez dans /client et faites npm start
	Une fenêtre de votre fureteur doit s’ouvrir, sinon allez à localhost:4200
