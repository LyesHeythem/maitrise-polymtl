
include "alldifferent.mzn";


% Nationalite = [anglais, espagnol, ukrainien, norvegien, japonais] ;
% Boisson= [eau, jus, the, cafe, lait] ;  % eau (on pose)
% Animal= [zebre, chien, escargot, renard, cheval] ;  % Zebre (on pose)
% CouleurdeMaison= [rouge, vert, jaune, bleu, blanc] ;
% Metier= [sculpteur, diplomate, medecin, violoniste, acrobate] ;


int: nc = 5; % nombre de cases
var 1..nc : anglais; 
var 1..nc : espagnol;
var 1..nc : ukrainien; 
var 1..nc : norvegien; 
var 1..nc : japonais;

var 1..nc : sculpteur; 
var 1..nc : diplomate; 
var 1..nc : medecin; 
var 1..nc: violoniste; 
var 1..nc: acrobate;

var 1..nc: jus; 
var 1..nc: the; 
var 1..nc: cafe; 
var 1..nc: lait; 
var 1..nc: eau;

var 1..nc: zebre; 
var 1..nc: chien; 
var 1..nc: escargot; 
var 1..nc: renard;
var 1..nc: cheval; 

var 1..nc: rouge; 
var 1..nc: vert; 
var 1..nc: jaune; 
var 1..nc: bleu; 
var 1..nc: blanc;
 

constraint anglais = rouge;  %L’Anglais habite à la maison rouge.
constraint espagnol = chien; %L’Espagnol a un chien.
constraint vert = cafe;      %Dans la maison verte, on boit du café.
constraint ukrainien = the;  %L’Ukrainien boit du thé.
constraint vert = blanc+1;   %La maison verte est immédiatement à droite de la maison blanche
constraint sculpteur = escargot; %Le sculpteur élève des escargots.
constraint diplomate = jaune;    %Le diplomate habite la maison jaune.
constraint lait = 3;             %Dans la maison du milieu, on boit du lait.
constraint norvegien = 1;        %Le Norvégien habite à la première maison à gauche.
constraint ((medecin = renard+1) \/ (medecin = renard-1)); %Le médecin habite dans une maison voisine de celle où demeure le propriétaire du renard.
constraint ((diplomate = cheval-1) \/ (diplomate = cheval+1));%La maison du diplomate est à côté de celle où il y a un cheval.
constraint violoniste = jus;%Le violoniste boit du jus d’orange.
constraint japonais = acrobate; %Le Japonais est acrobate.
constraint ((norvegien = bleu-1) \/ (norvegien = bleu+1)); %Le Norvégien habite à côté de la maison bleue.

%On pose : Cinq hommes de nationalité et de professions différentes habitent avec leur animal préféré cinq maisons de couleurs différentes où ils boivent leur boisson préférée.
constraint alldifferent([anglais, espagnol, ukrainien, norvegien, japonais]);
constraint alldifferent([eau, jus, the, cafe, lait]);
constraint alldifferent([zebre, chien, escargot, renard, cheval]);
constraint alldifferent([rouge, vert, jaune, bleu, blanc]);
constraint alldifferent([sculpteur, diplomate, medecin, violoniste, acrobate]);


solve satisfy;

output[
  "Nationalite: \n norvegien=\(norvegien)\n ukrainien=\(ukrainien)\n anglais=\(anglais)\n espagnol=\(espagnol)\n japonais=\(japonais)\n************** \nBoisson: \n eau=\(eau)\n************** \nAnimal: \n zebre=\(zebre)\n"];