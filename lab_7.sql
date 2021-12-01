SELECT * from zasob;
SELECT * from kreatura;
SELECT * FROM ekwipunek;
SELECT * FROM etapy_wyprawy;
SELECT * FROM sektor;
SELECT * FROM wyprawa;
SELECT * FROM uczestnicy;

select distinct id_uczestnika from uczestnicy; 
select distinct idKreatury from kreatura;

#lab 7

#złączanie zewnętrzne

select * from kreatura k left join uczestnicy u on k.idKreatury=u.id_uczestnika where u.id_uczestnika is NULL;


#zadanie 1.3

select w.nazwa, sum(e.ilosc) from wyprawa w 
inner join uczestnicy u ON w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
group by w.id_wyprawy;


#wyswietlanie danych - 'nazwy' w jednej lini
select rodzaj, group_concat(nazwa separator ' | ')
from kreatura group by rodzaj;

#zadanie 2 
select w.nazwa, count(u.id_uczestnika), group_concat(k.nazwa separator ' | ') from wyprawa w 
inner join uczestnicy u ON w.id_wyprawy=u.id_wyprawy
inner join kreatura k on u.id_uczestnika=k.idKreatury
group by w.id_wyprawy;

#zadanie 2.2
select w.id_wyprawy, ew.kolejnosc, s.nazwa, k.nazwa from sektor s 
inner join etapy_wyprawy ew ON ew.sektor=s.id_sektora
inner join wyprawa w ON w.id_wyprawy = ew.idWyprawy 
inner join kreatura k on w.kierownik = k.idKreatury
order by w.data_rozpoczecia,ew.kolejnosc ASC;



#Dzialanie 'if' i 'ifnull'
select ifnull(idKreatury, 'brak nazwy kreatury') from ekwipunek;

select if(idKreatury is NULL, 'brak nazwy kreatury',idkreatury) from ekwipunek;

#podsumowanie group by
...group by s.nazwa with rollup;


#Zadanie 3.1
#Sprawdzanie liczby unikalnych uczestnikow
select count(distinct id_uczestnika) from uczestnicy;

select s.nazwa, count(ew.sektor) from etapy_wyprawy ew 
inner join sektor s on ew.sektor=s.id_sektora
group by s.nazwa with rollup;

select s.nazwa, count(ew.sektor) from sektor s
left join etapy_wyprawy ew on ew.sektor=s.id_sektora
group by s.nazwa;

#Zadanie 3.2

select k.nazwa, ifnull(group_concat(w.nazwa separator ' | '), 'Nie bral udzialu w wyprawie') from wyprawa w 
right join uczestnicy u ON w.id_wyprawy=u.id_wyprawy
right join kreatura k on u.id_uczestnika=k.idKreatury
group by k.nazwa;

#Zadanie 4.2 
select idEtapu, idWyprawy, lenght(dziennik) from etapy_wyprawy;
















###Rozne zadania 

 Select * from kreatura natural join ekwipunek;

#identyfikacja niezbednych tabek do połączenia
select k.nazwa, z.nazwa from kreatura k 
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where k.rodzaj='wiking';


SELECT rodzaj,dataUr,nazwa from kreatura;

SELECT k.nazwa, k.rodzaj, k.dataUr from Kreatura k,
 (select rodzaj, min(dataUr) as min from kreatura group by rodzaj)as pod 
where k.dataur = pod.min;

select rodzaj,min(dataUr) from kreatura group by rodzaj
union
select rodzaj,max(dataUr) from kreatura group by rodzaj;


SELECT nazwa, dataUr, rodzaj FROM kreatura order BY dataUr desc limit 1;

select rodzaj,min(dataUr),max(dataUr) from kreatura group by rodzaj;



SELECT k.rodzaj, sum(e.ilosc),avg(z.waga) FROM kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where k.rodzaj not in('malpa','waz') and e.ilosc < 30 group by k.rodzaj;
