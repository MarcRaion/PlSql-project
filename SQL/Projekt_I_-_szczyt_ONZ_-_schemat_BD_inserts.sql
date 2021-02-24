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


