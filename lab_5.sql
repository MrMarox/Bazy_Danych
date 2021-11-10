# Zadanie 1

use sobieckim;

CREATE TABLE kreatura AS (SELECT * FROM wikingowie.kreatura);
CREATE TABLE zasob AS (SELECT * FROM wikingowie.zasob);
CREATE TABLE ekwipunek AS (SELECT * FROM wikingowie.ekwipunek);

SELECT * FROM zasob;
SELECT * FROM zasob where rodzaj = "jedzenie";
SELECT * FROM kreatura where idkreatury in (1,2,3,4);

SELECT zasob.idZasobu,zasob.ilosc FROM zasob INNER JOIN kreatura ON kreatura.idkreatury in (1,3,5);

#Zadanie 2 

SELECT * FROM kreatura where rodzaj != 'wiedzma' and udzwig > '50';
SELECT * FROM zasob where waga between '2' and '5';
SELECT * FROM kreatura where nazwa LIKE '%or%' AND udzwig between '30' and '70';

#Zadanie 3

SELECT * FROM zasob where Month(dataPozyskania) = '7' or Month(dataPozyskania) = '8';
SELECT * FROM zasob where rodzaj is NOT NULL ORDER BY waga ASC;
SELECT * FROM kreatura ORDER BY dataUR ASC LIMIT 5;

#Zadanie 4 

SELECT distinct(rodzaj) from zasob;
SELECT CONCAT (nazwa," ",rodzaj) AS nazwa_rodzaj FROM kreatura where rodzaj LIKE "wi%";
SELECT CONCAT (ilosc*waga) From zasob where YEAR(dataPozyskania) between '2000' and '2007';

#Zadanie 5 

SELECT CONCAT(waga*0.3) FROM zasob;
SELECT * FROM zasob where rodzaj is NULL;
SELECT distinct(rodzaj) from zasob where nazwa like "Ba%" or nazwa LIKE "%os";

