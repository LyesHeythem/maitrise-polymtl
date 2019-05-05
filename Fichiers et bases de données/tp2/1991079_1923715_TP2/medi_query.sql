-- Question a : Affichez tous les docteurs et leurs détails. Vous devez retourner tous les attributs.

SELECT * FROM MEDIDB.Doctor;

-- Question b : Affichez les patients et leurs paiements. Vous devez retourner tous les attributs.

SELECT * FROM MEDIDB.Patient NATURAL JOIN MEDIDB.Payment; 

-- Question c : Quels sont les rendez-vous (Appointment) du docteur dont le matricule est D001 ? Vous devez retourner tous les attributs.

SELECT * FROM MEDIDB.Appointment WHERE doctorid = 'D001';

-- Question d : Listez tous les spécialistes, incluant tous leurs attributs de médecin et leur champ de spécialité (FieldArea).

SELECT * FROM MEDIDB.Doctor NATURAL JOIN MEDIDB.Specialist;

-- Question e : Affichez le nom de tous les patients et leur date de naissance.

SELECT pname, dob FROM MEDIDB.Patient;


