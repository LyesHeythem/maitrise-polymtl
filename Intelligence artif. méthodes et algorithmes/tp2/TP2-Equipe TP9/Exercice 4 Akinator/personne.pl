ask(gouverne, Y) :- format('~w gouverne ? ', [Y]), nl, read(Reponse), Reponse = 'oui'.
ask(artist, Y) :- format('~w est un artiste ? ', [Y]),nl,read(Reponse),Reponse = 'oui'.
ask(drivers, Y) :-format('~w est un driver ? ', [Y]),nl,read(Reponse),Reponse = 'oui'.
ask(religious, Y) :-format('~w est un homme religieux ? ', [Y]), nl,read(Reponse),Reponse = 'oui'.
ask(fictional, Y) :-format('~w est un caractere de jeu video ? ', [Y]),nl,read(Reponse),Reponse = 'oui'.
ask(chanteur, X) :-format('~w est un chanteur ? ', [X]), nl,read(Reponse),Reponse = 'oui'. 
ask(musicien, X) :-format('~w est un musicien ? ', [X]),nl,read(Reponse),Reponse = 'oui'.     
ask(acteur, Y) :-format('~w est un acteur ? ', [Y]),nl,read(Reponse),Reponse = 'oui'.
ask(designer, X) :-format('~w est un designer ? ', [X]), nl,read(Reponse),Reponse = 'oui'.
ask(writer, X) :-format('~w est un ecrivain ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(peintre, X) :-format('~w est un peintre ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
%ask(driver, X) :-format('~w est un driver ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(fictionalCharacter, X) :-format('~w est un personnage de jeu ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(parleFrancais, X) :-format('~w parle francais ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(dancer, X) :-format('~w danse ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(songWriter, X) :-format('~w ecrit les paroles des chansons ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(jazz_pianist, X) :-format('~w est un pianiste de jazz ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(highestpaid, X) :-format('~w est le plus payé ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(secret_service_agent, X) :-format('~w est un agent de service secret ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(threeGoldenGlobe, X) :-format('~w a obtenu 3 golden globe ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(filmproducer, X) :-format('~w est un producteur de film ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(poet, X) :-format('~w est un poete ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(street_peintre, X) :-format('~w est un peintre de rue ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(director, X) :-format('~w est un directeur ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(threeFormula1, X) :-format('~w etait chompion mondial de Formula 1 dans 3 fois ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(twoFormula1, X) :-format('~w etait chompion mondial de Formula 1 dans 2 fois ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(cristainism, X) :-format('~w est un prophet du cristainism ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(abrahamicreligio, X) :-format('~w est un prophet envyé a peuple de Abraham ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(currentPope, X) :-format('~w est le pope actuel ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(budapest, X) :-format('~w est de origine de budapest ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(jeuvideo, X) :-format('~w est un caractere de jeu de video connu ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(stephen_harperDetail, X) :-format('~w est un economiste et entrepreneur ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(barack_obamaDetail, X) :-format('~w etait le presedent americain jusqu a 2017 ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(mikhail_gorbachevDetail, X) :-format('~w etait le 8eme leader de l union soveit ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(joseph_stalineDetail, X) :-format('~w etait le leader de l union soveit pendant la 2eme guerre mondiale ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(eisenhowerDetail, X) :-format('~w etait le 34eme presedent de usa ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(cleopatreDetail, X) :-format('~w etait le leader du royaume d egypt ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(richard_nixonDetail, X) :-format('~w etait le 37eme presedent de usa ? ', [X]),nl,read(Reponse),Reponse = 'oui'.
ask(jeuvideo, X) :-format('~w etait le 34eme presedent de usa ? ', [X]),nl,read(Reponse),Reponse = 'oui'.

personne(X):- findall(X, gouverneur(X), Y), length(Y, 1);
              findall(X, chanteur(X), Y), length(Y, 1);
              findall(X, acteur(X), Y), length(Y, 1);
              findall(X, writer(X), Y), length(Y, 1);
              findall(X, fictionalCharacter(X), Y), length(Y, 1);
              findall(X, prophet(X), Y), length(Y, 1);
              findall(X, driver(X), Y), length(Y, 1).
personne(X):-  ask(gouverne,X), politicien(X).
personne(X):-  ask(artist,X), artiste(X).
personne(X):-  ask(drivers,X), drivers(X).
personne(X):-  ask(religious,X), relegious(X).
personne(X):-  ask(fictional,X), fictional(X).


politicien(X):- findall(X, gouverneur(X), Y), length(Y, 1).
politicien(X) :-gouverneDetail(X).


artiste(X):- findall(X, chanteur(X), Y), length(Y, 1);
              findall(X, acteur(X), Y), length(Y, 1);
              findall(X, writer(X), Y), length(Y, 1).
artiste(X) :-ask(chanteur, X), chanteurDetail(X). 
artiste(X) :-ask(musicien,X), musicienDetail(X).
artiste(X) :-ask(acteur, X), acteurDetail(X).
artiste(X) :-ask(designer, X), designerDetail(X).
artiste(X) :-ask(writer, X), writerDetail(X).
artiste(X) :-ask(peintre,X), peintreDetail(X).

drivers(X):- findall(X, driver(X), Y), length(Y, 1).

drivers(X) :-driverDetail(X).

relegious(X):- findall(X, prophet(X), Y), length(Y, 1);
               findall(X, pope(X), Y), length(Y, 1).
relegious(X) :-relegiousDetail(X).

fictional(X):- findall(X, fictionalCharacter(X), Y), length(Y, 1).
fictional(X) :-ask(fictionalCharacter, X), fictionalDetail(X).

gouverne(stephen_harper,canada). 
gouverne(barack_obama,usa).

gouverne(mikhail_gorbachev,soveit).
gouverne(joseph_staline,soveit). 
gouverne(eisenhower,usa).
gouverne(cleopatre,egypt).
gouverne(richard_nixon,usa).

pays(canada).
pays(usa).
pays(soveit).
pays(egypt).
gouverneDetail(X):- ask(stephen_harperDetail, X), stephen_harperDetail(X),pays(Y), gouverne(X,Y).
gouverneDetail(X):- ask(barack_obamaDetail, X), barack_obamaDetail(X), pays(Y), gouverne(X, Y) .
gouverneDetail(X):- ask(mikhail_gorbachevDetail, X), mikhail_gorbachevDetail(X), pays(Y), gouverne(X,Y).
gouverneDetail(X):- ask(joseph_stalineDetail, X), joseph_stalineDetail(X), pays(Y), gouverne(X,Y).
gouverneDetail(X):- ask(cleopatreDetail, X), cleopatreDetail(X), pays(Y), gouverne(X,Y).
gouverneDetail(X):- ask(richard_nixonDetail, X), richard_nixonDetail(X), pays(Y), gouverne(X, Y).
gouverneDetail(X):- ask(eisenhowerDetail, X), eisenhowerDetail(X), pays(Y), gouverne(X, Y).

chanteurDetail(X):- ask(parleFrancais, X), parleFrancais(X), chanteur(X).
chanteurDetail(X):- ask(dancer, X), dancer(X), chanteur(X).
chanteurDetail(X):- ask(songWriter, X), songWriter(X), chanteur(X).
musicienDetail(X):- ask(jazz_pianist, X), jazz_pianist(X), musicien(X).
acteurDetail(X):- ask(highestpaid, X), highestpaid(X), acteur(X).
acteurDetail(X):- ask(writer, X), writer(X), acteur(X).
acteurDetail(X):- ask(secret_service_agent, X), secret_service_agent(X), acteur(X).
acteurDetail(X):- ask(threeGoldenGlobe, X), threeGoldenGlobe(X), acteur(X).
writerDetail(X):- ask(filmproducer, X), filmproducer(X), writer(X).
writerDetail(X):- ask(poet, X), poet(X), writer(X).
peintreDetail(X):- ask(street_peintre, X), street_peintre(X), peintre(X).
designerDetail(X):- ask(director, X), director(X), designer(X).
driverDetail(X):- ask(threeFormula1, X), threeFormula1(X), driver(X).
driverDetail(X):- ask(twoFormula1, X), twoFormula1(X), driver(X).
relegiousDetail(X):- ask(cristainism, X), cristainism(X), prophet(X). 
relegiousDetail(X):- ask(abrahamicreligio, X), abrahamicreligio(X), prophet(X).
relegiousDetail(X):- ask(currentPope, X), currentPope(X), pope(X).
fictionalDetail(X):- ask(budapest, X), budapest(X), fictionalCharacter(X).
fictionalDetail(X):- ask(jeuvideo, X), jeuvideo(X), fictionalCharacter(X).


gouverneur(stephen_harper).
gouverneur(barack_obama).
gouverneur(mikhail_gorbachev).
gouverneur(joseph_staline).
gouverneur(eisenhower).
gouverneur(cleopatre).
gouverneur(richard_nixon).
chanteur(celine_dion).%chanteur, women
chanteur(micheal_jackson). %chanteur, man
chanteur(lady_gaga).%acteur, chanteur, women
acteur(jennifer_lawrence). %acteur, women
acteur(quentin_tarantino).% acteur, writer, man
acteur(james_bond). % acteur, man
acteur(denzel_washington). % acteur, man
designer(hideo_kojima). % video game designer, man
peintre(banksy). %street peintre, man
fictionalCharacter(lora_croft). %fictional charcter, women
fictionalCharacter(mario). %fictional character, man
writer(j_k_rowling). % writer, women
writer(victor_hugo). % writer, man
writer(quentin_tarantino).
musicien(john_lewis). %man
prophet(jesus). % prophet, man
prophet(moise). % prophet, man
driver(ayrton_senna). % driver, man
driver(fernando_alonso). %driver, man
pope(francois). %pope, man




stephen_harperDetail(stephen_harper).
barack_obamaDetail(barack_obama).
mikhail_gorbachevDetail(mikhail_gorbachev).
joseph_stalineDetail(joseph_staline).
eisenhowerDetail(eisenhower).
cleopatreDetail(cleopatre).
richard_nixonDetail(richard_nixon).
parleFrancais(celine_dion). % celine dion
dancer(micheal_jackson).
jazz_pianist(john_lewis).
highestpaid(jennifer_lawrence).
director(hideo_kojima).
political(banksy).
budapest(lora_croft).
jeuvideo(mario).
filmproducer(j_k_rowling).
songWriter(lady_gaga).
poet(victor_hugo).
cristainism(jesus).
abrahamicreligio(moise).
threeFormula1(ayrton_senna).
twoFormula1(fernando_alonso).
secret_service_agent(james_bond).
threeGoldenGlobe(denzel_washington).
currentPope(francois).
street_peintre(banksy).