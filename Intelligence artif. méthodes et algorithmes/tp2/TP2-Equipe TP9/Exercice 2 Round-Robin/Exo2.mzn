include "globals.mzn";

int: nmbrTeams = 14;
int: nmbrRounds = nmbrTeams-1;
set of int: Teams = 1..nmbrTeams;
set of int: Rounds = 1..nmbrRounds;

% pv[i,j] = 1 si i joue contre j à domicile ou pv[i,j] = 0 si i joue contre j à l’extérieur.

array[Teams,Teams] of 0..1: pv;
pv = [|
0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1|
1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1|
0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0|
0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0|
1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0|
1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0|
0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1|
1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0|
1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0|
1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1|
0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0|
0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0|
0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0|
0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0|];

% Dans le tour k, l'équipe i joue contre l'équipe adversaire[i,k]
array[Teams,Rounds] of var Teams: adversaire;

% lieu[i,k] = 1 ssi l'équipe i joue à domicile dans le tour k
array[Teams,Rounds] of var 0..1: lieu;
constraint forall (i in Teams, k in Rounds) (lieu[i,k] = pv[i,adversaire[i,k]]);

% Pouc casser la symétrie, on fixe le premier tour.
% constraint (adversaire[1,1] > adversaire[1,nmbrRounds] );

% Une équipe ne peut pas jouer contre elle-même.
constraint forall (i in Teams, k in Rounds) (adversaire[i,k] != i);

% Dans un tour k, Si une équipe A joue contre une équipe B, alors l’équipe B joue contre l’équipe A.
constraint forall (i in Teams, k in Rounds) (adversaire[adversaire[i,k],k] = i);

%	Pour chaque équipe, tous les adversaires sont différents.
constraint forall (i in Teams) (alldifferent([adversaire[i,k] | k in Rounds]));

% Le critère de quatre matches successives maximale à domicile ou à l’extérieur. 
constraint forall (i in Teams, k in 1..(nmbrRounds-3))((lieu[i,k]+lieu[i,k+1]+lieu[i,k+2]+lieu[i,k+3]!=4));
constraint forall (i in Teams, k in 1..(nmbrRounds-3))((lieu[i,k]+lieu[i,k+1]+lieu[i,k+2]+lieu[i,k+3]!=0));

% (GLOBAL CONSTRAINT) Le critère de quatre matches successives maximale à domicile ou à l’extérieur. 
% constraint forall (i in Teams, k in 1..(nmbrRounds-3))
% (alldifferent([(lieu[i,k]+lieu[i,k+1]+lieu[i,k+2]+lieu[i,k+3]),0,4] ));


solve satisfy ;

% Affichage de résultat (Forme d'un calendrier)

output [    " %% Calendrier: Lignes= équipes, colonnes= tours, E= à l'extèrieur, D= à domicile %%  \n %% Exemple: (Équipe_1: D_4) =>  (L'équipe_1 joue contre l'équipe 4 à domocile) %% \n\n%Équipe_1  :" ] 
++ [ 
    if fix(lieu[i,k]) == 1 then " D_" else " E_" endif ++    
	  if fix(adversaire[i,k]<=9) then show(adversaire[i,k])++ " " else show(adversaire[i,k]) endif ++ " " ++   
    if k == nmbrRounds /\ i != nmbrTeams then 
                                          if i<9 then "\n%Équipe_"++ show(i+1) ++ "  :"
                                          else "\n%Équipe_"++ show(i+1) ++ " :"
                                          endif
    else "" 
    endif
          | i in Teams, k in Rounds ] ++ ["\n"] ++   [       ];