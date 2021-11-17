#avg() = srednia
#count() zlicza ilosc elementow
#sum() = suma
group by = grupowanie 
HAVING = where dla grupy | Filtrowanie po agregacji
DISTINCT = wybiera unikalne usuwa powtorki 


SELECT nazwa,rodzaj FROM kreatura group by rodzaj;

SELECT rodzaj ,avg(udzwig) FROM kreatura group by rodzaj;

Skracanie kodu

orginalny 
SELECT kreatura.nazwa, sum(ekwipunek.ilosc) FROM kreatura INNER JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury group by nazwa;

zmieniony
SELECT k.nazwa, sum(e.ilosc) FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury group by nazwa;

Zadanie 1.

SELECT rodzaj, avg(udzwig) from kreatura where rodzaj="wiking";

SELECT rodzaj,avg('2021'-YEAR(dataUR) from kreatura group by rodzaj;

SELECT rodzaj,avg('2021'-YEAR(dataUR)) from kreatura group by rodzaj;

Zadanie 2.

SELECT rodzaj, sum(waga) from zasob group by rodzaj;

SELECT nazwa, avg(waga) from zasob where ilosc >=4 group by nazwa having  sum(waga) > 10;

SELECT count(DISTINCT(nazwa)), rodzaj from zasob group by rodzaj having sum(ilosc) > 1;

Zadanie 3.

- - SELECT  * from kreatura, ekwipunek where kreatura.idKreatury = ekwipunek.idKreatury;

SELECT k.nazwa, sum(e.ilosc) FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury group by nazwa;

SELECT k.nazwa, z.nazwa FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury INNER JOIN zasob z ON z.idZasobu = e.idZasobu;

SELECT nazwa, idKreatury FROM kreatura where idKreatury not in (SELECT idKreatury from ekwipunek where idKreatury is not null);

Zadanie 4.

#zlaczenie tabeli samej ze soba poprzez dodanie aliasow
SELECT * FROM kreatura k1, kreatura k2
where k1.idKreatury=k2.idKreatury;
 

