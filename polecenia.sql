SHOW CREATE TABLE POSTAC

[Tworzenie Tabeli]

CREATE TABLE `postac` (
  `id_postaci` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(40) DEFAULT NULL,
  `rodzaj` enum('wiking','ptak','kobieta') DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int NOT NULL,
  PRIMARY KEY (`id_postaci`)
);

Dodawanie do tabeli

INSERT INTO postac (nazwa, rodzaj, data_ur, wiek)
 VALUES 
 ('Bjorn', 'wiking', '2203-06-16', 76),
 ('Drozd', 'ptak', '2143-07-30', 136),
 ('Tesciowa', 'kobieta', '2100-12-10', 176);

Aktualizacja danych 

UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';

--------------------------------------------------------------

ZADANIE 2 

CREATE TABLE `walizka`(
 `id_walizki` int AUTO_INCREMENT PRIMARY KEY,
 `pojemnosc` int,
 `kolor` enum('rozowy', 'czerwony', 'teczowy', 'zolty'),
 `id_wlasciciela` int,   
 FOREIGN KEY(id_wlasciciela) REFERENCES postac(id_postaci) ON DELETE CASCADE
);

Zmiana wartosci domyslnej 

ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

Dodawanie rekord?w

INSERT INTO walizka (pojemnosc,kolor,id_wlasciciela) 
VALUES 
('5','rozowy','1'), 
('20','czerwony','3');
-------------------------------------------------------------------
Zadanie 3

CREATE TABLE izba ( 
adres_budynku INT NOT NULL, 
nazwa_izby INT NOT NULL, 
metraz INT, 
wlasciciel INT,
PRIMARY KEY(adres_budynku, nazwa_izby),
FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL
);

ALTER TABLE izba ADD COLUMN kolor VARCHAR(50) AFTER metraz;

ALTER TABLE izba ALTER kolor SET DEFAULT 'czarny';

INSERT INTO izba VALUES(default, '8c', 'll', '300','bialy',1);

-------------------------------------------------------------------
Zadanie 4 

CREATE TABLE `przetwory`(
id_przetworu int AUTO_INCREMENT PRIMARY KEY,
rok_produkcji int DEFAULT '1654',
id_wykonawcy int,
zawartosc VARCHAR(40),
dodatek VARCHAR(40) DEFAULT 'chilli',
id_konsumenta int,
FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci),
FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci)
);

INSERT INTO przetwory VALUES (default,default,2,'bigos',default,1);





