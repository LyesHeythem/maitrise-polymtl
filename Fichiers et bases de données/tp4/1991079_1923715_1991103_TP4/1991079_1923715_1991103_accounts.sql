SET search_path = public;
CREATE TABLE Accounts (
acctID INTEGER NOT NULL PRIMARY KEY,
balance INTEGER NOT NULL,
CONSTRAINT remains_nonnegative CHECK (balance >= 0)
);

--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;


--Q1 a

-- TRANSACTION A
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL READ
COMMITTED;
SELECT balance -200 as bal
into balancea
FROM Accounts WHERE acctID
= 101;
SELECT bal FROM balancea;

-- TRANSACTION B
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL READ
COMMITTED;
SELECT balance - 500 as bal
into balanceb
FROM Accounts WHERE acctID =
101;
SELECT bal from balanceb;

-- TRANSACTION A
UPDATE Accounts
SET balance = (select bal
from balancea)
WHERE acctID = 101;

-- TRANSACTION B
UPDATE Accounts
SET balance = (select bal
from balanceb)
WHERE acctID = 101;

-- TRANSACTION A
SELECT acctID, balance
FROM Accounts
WHERE acctID = 101;
COMMIT;

-- TRANSACTION B
SELECT acctID, balance
FROM Accounts
WHERE acctID = 101;
COMMIT;

-- Lorsque la transaction B veut faire l�UPDATE sur la balance de acctId=101, elle est bloqu�e/en attente car la transaction A n'a pas fait de commit et B veut agir sur le m�me tuple que A. La transaction A affiche ensuite la balance mise � jour par A (800). Apr�s le commit, la transaction B est d�bloqu�e. Puis, la transaction B affiche la balance mise � jour par B (500). Le probl�me est qu�� la fin le tuple n�a pris en compte que la modification effectu�e par B et pas du tout celle de A.


--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;

--- Q1 b

-- TRANSACTION A
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL REPEATABLE READ;
SELECT balance -200 as bal
into balancea
FROM Accounts WHERE acctID
= 101;
SELECT bal FROM balancea;

-- TRANSACTION B
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL REPEATABLE READ;
SELECT balance - 500 as bal
into balanceb
FROM Accounts WHERE acctID =
101;
SELECT bal from balanceb;

-- TRANSACTION A
UPDATE Accounts
SET balance = (select bal
from balancea)
WHERE acctID = 101;

-- TRANSACTION B
UPDATE Accounts
SET balance = (select bal
from balanceb)
WHERE acctID = 101;

-- TRANSACTION A
SELECT acctID, balance
FROM Accounts
WHERE acctID = 101;
COMMIT;

-- TRANSACTION B
SELECT acctID, balance
FROM Accounts
WHERE acctID = 101;
COMMIT;

-- Pour s�assurer que les r�sultats soient coh�rents, on change le niveau d�isolation des transactions a REPEATABLE READ. Ainsi, on ne peut pas modifier le m�me objet au m�me moment, la deuxi�me transaction est annul�e et une erreur apparait.
-- Q2-a

--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;

-- Transaction A
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL READ
COMMITTED;
SELECT * FROM Accounts
WHERE balance > 500;

-- Transaction B
\set AUTCOMMIT 'off';
BEGIN;
UPDATE Accounts
SET balance = balance - 500
WHERE acctID = 101;
UPDATE Accounts
SET balance = balance + 500
WHERE acctID = 202;
SELECT * FROM Accounts;
COMMIT;

-- Transaction A
SELECT * FROM Accounts
WHERE balance > 500;

-- Le probl�me est que dans la transaction A, la m�me requ�te SELECT renvoie deux r�sultats diff�rents. On a une anomalie Nonrepeatable read (lecture non reproductible).

-- Q2-b

--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;

-- Transaction A
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL
REPEATABLE READ;
SELECT * FROM Accounts
WHERE balance > 500;

-- Transaction B
\set AUTCOMMIT 'off';
BEGIN;
UPDATE Accounts
SET balance = balance - 500
WHERE acctID = 101;
UPDATE Accounts
SET balance = balance + 500
WHERE acctID = 202;
SELECT * FROM Accounts;
COMMIT;

-- Transaction A
SELECT * FROM Accounts
WHERE balance > 500;

-- Si on change le niveau d�isolation de la transaction A � REPEATABLE READ, la requ�te A renvoie le m�me r�sultat pour les deux SELECT car quand la transaction commence, elle ne voit pas les changement faits par une autre transaction. Il n�y a plus l�anomalie Nonrepeatable read (lecture non reproductible).

--- Q2 c
--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;

-- Transaction A
\set AUTCOMMIT 'off';
BEGIN;
SET TRANSACTION
ISOLATION LEVEL REPEATABLE
READ READ ONLY;

-- Transaction B
\set AUTCOMMIT 'off';
BEGIN;
INSERT INTO Accounts
(acctID,
balance) VALUES (301,3000);

-- Transaction A
SELECT * FROM Accounts
WHERE balance > 1000;

-- Transaction B
INSERT INTO Accounts
(acctID,
balance) VALUES (302,3000);

-- Transaction A
SELECT * FROM Accounts
WHERE balance > 1000;
COMMIT;

-- Le probl�me est que la transaction A ne voit pas les insertions effectu�es par B.

-- Q3- Deadlock
--  data
DROP TABLE if EXISTS balancea CASCADE;
DROP TABLE if EXISTS balanceb CASCADE;
DELETE FROM Accounts;
INSERT INTO Accounts (acctID, balance) VALUES (101, 1000);
INSERT INTO Accounts (acctID, balance) VALUES (202, 2000);
SELECT * FROM Accounts;

-- Transaction A
\set AUTCOMMIT 'off';
BEGIN;
UPDATE Accounts
SET balance = balance - 500
WHERE acctID = 101;

-- Transaction B
\set AUTCOMMIT 'off';
BEGIN;
UPDATE Accounts
SET balance = balance + 500
WHERE acctID = 202;
UPDATE Accounts
SET balance = balance + 500
WHERE acctID = 101;

-- Transaction A
UPDATE Accounts
SET balance = balance - 500
WHERE acctID = 202;


