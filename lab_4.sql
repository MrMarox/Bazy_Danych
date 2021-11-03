DELETE FROM postac where rodzaj="wiking";

#usuwanie klucza obcego
ALTER TABLE postac DROP FOREIGN KEY .....;

ALTER TABLE postac DROP PRIMARY KEY;

alter table postac add pesel char(11) first; 

# zadanie 3 

SELECT nazwa FROM postac
WHERE nazwa LIKE '__-___';

SELECT nazwa FROM postac
WHERE nazwa LIKE '%a';

SELECT 'Michael!' REGEXP '.*';

b) 
UPDATE statek SET ladownosc=0.7 * ladownosc
WHERE data_wodowania >='1901-01-01' 
and data_wodowania <= '2000-12-31'; 

UPDATE statek SET ladownosc=0.7 * ladownosc
WHERE data_wodowania BETWEEN '1901-01-01' 
and '2000-12-31';

c)
ALTER TABLE postac MODIFY wiek int unsigned CHECK (wiek < 1000);

# Zadanie 4 
a) ALTER TABLE postac MODIFY rodzaj ....
b)

CREATE TABLE marynarz LIKE postac;

CREATE TABLE marynarz SELECT * FROM postac;

SELECT id_postaci, nazwa FROM postac;

CREATE TABLE wikingowie;
SELECT * FROM postac WHERE nazwa='wiking';

# ZADANIE 5

a) UPDATE...

wstawianie null w kolumnie statek tabeli postaci (o ile to możliwe - jeżeli nie, to zmieniamy atrybut kolumny statek tak, żeby dało się null wstawic).

b) DELETE FROM postac WHERE...

c)DROP TABLE statek ; (jeżeli są klucze obce to ...)


....

pozbycie sie auto increment 
alter table postac modify id_postaci int ;
dodanie nowego klucza glownego
alter table postac add primary key (pesel);

alter table postac modify pesel char(11) not null; 

update postac set pesel


