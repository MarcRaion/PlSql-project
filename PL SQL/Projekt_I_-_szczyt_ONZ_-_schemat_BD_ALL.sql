-- Utworzenie Tabel

-- Table: JezykiSlownik
CREATE TABLE JezykiSlownik (
    IdJezykS integer  NOT NULL,
    Jezyk varchar2(40) UNIQUE NOT NULL,
    CONSTRAINT JezykiSlownik_pk PRIMARY KEY (IdJezykS)
) ;

-- Table: JezykiUczestnik
CREATE TABLE JezykiUczestnik (
    IdJezykU integer  NOT NULL,
    UIdUczestnik integer  NOT NULL,
    IdJezykS integer  NOT NULL,
    CONSTRAINT JezykiUczestnik_pk PRIMARY KEY (IdJezykU)
) ;

-- Table: Kraje
CREATE TABLE Kraje (
    IdKraj integer  NOT NULL,
    Kraj varchar2(40) UNIQUE NOT NULL,
    CONSTRAINT Kraje_pk PRIMARY KEY (IdKraj)
) ;

-- Table: Miasto
CREATE TABLE Miasto (
    IdMiasto integer  NOT NULL,
    Miasto varchar2(40)  NOT NULL,
    KIdKraj integer  NOT NULL,
    CONSTRAINT Miasto_pk PRIMARY KEY (IdMiasto)
) ;

-- Table: Organizacje
CREATE TABLE Organizacje (
    IdOrganizacja integer  NOT NULL,
    Organizacja varchar2(40) UNIQUE NOT NULL,
    CONSTRAINT Organizacje_pk PRIMARY KEY (IdOrganizacja)
) ;

-- Table: Organizator
CREATE TABLE Organizator (
    IdOrganizator integer  NOT NULL,
    Data date  NOT NULL,
    MIdMiasto integer  NOT NULL,
    TIdTemat integer  NOT NULL,
    CONSTRAINT Organizator_pk PRIMARY KEY (IdOrganizator),
	CONSTRAINT Organizator_date CHECK (Data < TO_DATE('2040-12-31', 'yyyy-mm-dd'))
) ;

-- Table: Tematy
CREATE TABLE Tematy (
    IdTemat integer  NOT NULL,
    Temat varchar2(40)  NOT NULL,
    IdProwadzacy integer  NOT NULL,
    CONSTRAINT Tematy_pk PRIMARY KEY (IdTemat)
) ;

-- Table: Uczestnicy
CREATE TABLE Uczestnicy (
    IdUczestnik integer  NOT NULL,
    Imie varchar2(40)  NOT NULL,
    Nazwisko varchar2(40)  NOT NULL,
    IdKraj integer  NULL,
    IdOrganizacja integer  NULL,
    CONSTRAINT Uczestnicy_pk PRIMARY KEY (IdUczestnik)
) ;

-- foreign keys
-- Reference: JezU_JezS (table: JezykiUczestnik)
ALTER TABLE JezykiUczestnik ADD CONSTRAINT JezU_JezS
    FOREIGN KEY (IdJezykS)
    REFERENCES JezykiSlownik (IdJezykS);

-- Reference: Jez_Ucz (table: JezykiUczestnik)
ALTER TABLE JezykiUczestnik ADD CONSTRAINT Jez_Ucz
    FOREIGN KEY (UIdUczestnik)
    REFERENCES Uczestnicy (IdUczestnik);

-- Reference: Miasto_Kraje (table: Miasto)
ALTER TABLE Miasto ADD CONSTRAINT Miasto_Kraje
    FOREIGN KEY (KIdKraj)
    REFERENCES Kraje (IdKraj);

-- Reference: Orgr_Miasto (table: Organizator)
ALTER TABLE Organizator ADD CONSTRAINT Orgr_Miasto
    FOREIGN KEY (MIdMiasto)
    REFERENCES Miasto (IdMiasto);

-- Reference: Orgr_Tem (table: Organizator)
ALTER TABLE Organizator ADD CONSTRAINT Orgr_Tem
    FOREIGN KEY (TIdTemat)
    REFERENCES Tematy (IdTemat);

-- Reference: Tem_Ucz (table: Tematy)
ALTER TABLE Tematy ADD CONSTRAINT Tem_Ucz
    FOREIGN KEY (IdProwadzacy)
    REFERENCES Uczestnicy (IdUczestnik);

-- Reference: Ucz_Kraje (table: Uczestnicy)
ALTER TABLE Uczestnicy ADD CONSTRAINT Ucz_Kraje
    FOREIGN KEY (IdKraj)
    REFERENCES Kraje (IdKraj);

-- Reference: Ucz_Orge (table: Uczestnicy)
ALTER TABLE Uczestnicy ADD CONSTRAINT Ucz_Orge
    FOREIGN KEY (IdOrganizacja)
    REFERENCES Organizacje (IdOrganizacja);

--Dodanie rekordów do tabel

--Kraje  WYKONANE
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('1','Polska');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('2','Niemcy');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('3','Rosja');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('4','Anglia');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('5','Francja');

--Organizacje
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('1','ONZ');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('2','WWF');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('3','Greenpeace');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('4','Loesje');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('5','ISACA');

--Miasta
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('1','Warszawa','1');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('2','Paryz','5');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('3','Londyn','4');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('4','Petersburg','3');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('5','Berlin','2');

--Jezyki
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (1,'polski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (2,'angielski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (3,'niemiecki');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (4,'francuski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (5,'rosyjski');

--Uczestnicy
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (1,'Slawomir','Toczek',1,NULL);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (2,'Wasilij','Rasputin',3,NULL);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (3,'Steffen','Schimler',2,NULL);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (4,'Parpois','Je Lipapou',5,NULL);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (5,'Jan','Kritecka',NULL,3);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (6,'Andrew','Golara',NULL,1);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (7,'Donald','Kluusk',NULL,2);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (8,'Janne','Ahonnen',NULL,4);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (9,'Eva','Purple',4,NULL);
INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (10,'Mariusz','Tanioskoryniesprzedam',NULL,5);

--Tematy
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (1,'Gotowanie kamienia',10);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (2,'Marynowanie sledzia',6);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (3,'Odpowiednie ciasto na pierogi',2);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (4,'Dostep do morza',5);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (5,'Ochrona danych osobowych Koali oraz Kiwi',7);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (6,'Lorem ipsum',8);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (7,'Zmiana nazwiska dla zon przywodcow',9);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (8,'Inwestycja w the Boring Company',4);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (9,'Szogun jako ikona popkultury',1);
INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (10,'Kawa z mlekiem',5);

--Organizator
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (1, to_date('2009-07-01'), 1, 10);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (2, to_date('2008-01-03'), 2, 9);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (3, to_date('2009-07-15'), 2, 8);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (4, to_date('2008-12-12'), 3, 7);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (5, to_date('2009-05-01'), 4, 6);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (6, to_date('2009-04-01'), 5, 5);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (7, to_date('2008-11-15'), 2, 4);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (8, to_date('2009-07-03'), 1, 3);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (9, to_date('2009-12-01'), 2, 2);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (10, to_date('2009-07-02'), 1, 1);

--JezykiUczestnik Kto mowi jakim jezykiem
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (1, 1, 1);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (2, 2, 5);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (3, 2, 2);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (4, 3, 2);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (5, 3, 3);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (6, 3, 4);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (7, 4, 4);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (8, 5, 4);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (9, 5, 2);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (10, 6, 1);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (11, 7, 1);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (12, 7, 3);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (13, 8, 5);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (14, 9, 3);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (15, 10, 1);
INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (16, 10, 5);


--(2pkt) 2 polecenia SELECT ze z³¹czeniem tabel, w tym przynajmniej jedno z funkcjami grupuj¹cymi
--(1pkt) 1 polecenie UPDATE z warunkiem WHERE
--(1pkt) 1 polecenie DELETE z warunkiem WHERE
--(2pkt) 1 polecenie SELECT z podzapytaniem
--(3pkt) 1 polecenie SELECT z podzapytaniem skorelowanym

--Wybierz wszystkie osoby prowadzace tematy wraz z ich tytulami na konferencjach w miescie Warszawa
SELECT t.temat, (u.imie || ' ' || u.nazwisko) as "Imie i nazwisko"
FROM Organizator o INNER JOIN Miasto m ON o.midmiasto = m.idmiasto
INNER JOIN Tematy t ON o.tidtemat = t.idprowadzacy
INNER JOIN Uczestnicy u ON u.iduczestnik = t.idprowadzacy
WHERE m.miasto = 'Warszawa'
;

--Wskaz liczbe delegatow mowiacych po angielsku i z ilu krajow pochodza
SELECT COUNT(*) as "Angielskojezyczni"
FROM JezykiUczestnik ju
LEFT JOIN JezykiSlownik js ON ju.idjezyks = js.idjezyks
WHERE js.jezyk LIKE 'angielski'
;

--Pan Mariusz Tanioskoryniesprzedam postanowil zmienic tozsamosc. Nazywa sie teraz Mariusz Bohr.
UPDATE Uczestnicy
SET Nazwisko = 'Bohr'
WHERE Nazwisko LIKE 'Tanioskoryniesprzedam'
;
--sprawdzenie
SELECT *
FROM Uczestnicy
WHERE nazwisko LIKE 'Bohr'
;

--Pan Steffen Schimler podczas konferencji obrazil sie na wszystkich za odmienne zdanie i postanowil sie do nikogo wiecej nie odezwac. Trzeba usunac dane na temat znajomosci jezykow
DELETE FROM JezykiUczestnik ju
WHERE ju.uiduczestnik = (SELECT u.iduczestnik
                        FROM Uczestnicy u
                        WHERE u.nazwisko LIKE 'Schimler'
                            )
;
--sprawdzenie
SELECT * 
FROM JezykiUczestnik ju
LEFT JOIN Uczestnicy u ON ju.uiduczestnik = u.iduczestnik
WHERE u.nazwisko LIKE 'Schimler'                          
; 


--Pokaz date oraz tematy konferencji z miasta Paryz (ID 2/ szt 3)
SELECT o.data, t.temat as "Paryskie tematy"
FROM Organizator o
LEFT JOIN Tematy t ON t.idtemat = o.tidtemat
WHERE o.midmiasto = (SELECT m.idmiasto
                    FROM Miasto m
                    WHERE m.miasto LIKE 'Paryz'
                    )
;

--Pokaz uczestnikow i ile kazdy z nich jest prowadzi tematow
SELECT u.imie, u.nazwisko, 
(
	SELECT COUNT(t.idtemat) 
	FROM Tematy t
	WHERE u.iduczestnik = t.idprowadzacy
 
) as "Liczba tematow"
FROM Uczestnicy u
;







