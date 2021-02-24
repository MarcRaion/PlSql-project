--=============================================================
--=					        DROP            	   			  =
--=============================================================

ALTER TABLE JezykiUczestnik
    DROP CONSTRAINT JezU_JezS;

ALTER TABLE JezykiUczestnik
    DROP CONSTRAINT Jez_Ucz;

ALTER TABLE Miasto
    DROP CONSTRAINT Miasto_Kraje;

ALTER TABLE Organizator
    DROP CONSTRAINT Orgr_Miasto;

ALTER TABLE Organizator
    DROP CONSTRAINT Orgr_Tem;

ALTER TABLE Tematy
    DROP CONSTRAINT Tem_Ucz;

ALTER TABLE Uczestnicy
    DROP CONSTRAINT Ucz_Kraje;

ALTER TABLE Uczestnicy
    DROP CONSTRAINT Ucz_Orge;

-- tables
DROP TABLE JezykiSlownik;

DROP TABLE JezykiUczestnik;

DROP TABLE Kraje;

DROP TABLE Miasto;

DROP TABLE Organizacje;

DROP TABLE Organizator;

DROP TABLE Tematy;

DROP TABLE Uczestnicy;

GO

--=============================================================
--=					        CREATE           	   			  =
--=============================================================

-- tables
-- Table: JezykiSlownik
CREATE TABLE JezykiSlownik (
    IdJezykS integer  NOT NULL,
    Jezyk varchar(40) UNIQUE NOT NULL,
    CONSTRAINT JezykiSlownik_pk PRIMARY KEY (IdJezykS)
) ;

GO

-- Table: JezykiUczestnik
CREATE TABLE JezykiUczestnik (
    IdJezykU integer  NOT NULL,
    UIdUczestnik integer  NOT NULL,
    IdJezykS integer  NOT NULL,
    CONSTRAINT JezykiUczestnik_pk PRIMARY KEY (IdJezykU)
) ;
GO
-- Table: Kraje
CREATE TABLE Kraje (
    IdKraj integer  NOT NULL,
    Kraj varchar(40) UNIQUE NOT NULL,
    CONSTRAINT Kraje_pk PRIMARY KEY (IdKraj)
) ;
GO
-- Table: Miasto
CREATE TABLE Miasto (
    IdMiasto integer  NOT NULL,
    Miasto varchar(40)  NOT NULL,
    KIdKraj integer  NOT NULL,
    CONSTRAINT Miasto_pk PRIMARY KEY (IdMiasto)
) ;
GO
-- Table: Organizacje
CREATE TABLE Organizacje (
    IdOrganizacja integer  NOT NULL,
    Organizacja varchar(40) UNIQUE NOT NULL,
    CONSTRAINT Organizacje_pk PRIMARY KEY (IdOrganizacja)
) ;
GO
-- Table: Organizator
CREATE TABLE Organizator (
    IdOrganizator integer  NOT NULL,
    Data date  NOT NULL,
    MIdMiasto integer  NOT NULL,
    TIdTemat integer  NOT NULL,
    CONSTRAINT Organizator_pk PRIMARY KEY (IdOrganizator),
	CONSTRAINT Organizator_date CHECK (Data < '2040-12-31')
	--ISDATE('2000-01-01')
) ;
GO
-- Table: Tematy
CREATE TABLE Tematy (
    IdTemat integer  NOT NULL,
    Temat varchar(40)  NOT NULL,
    IdProwadzacy integer  NOT NULL,
    CONSTRAINT Tematy_pk PRIMARY KEY (IdTemat)
) ;
GO
-- Table: Uczestnicy
CREATE TABLE Uczestnicy (
    IdUczestnik integer  NOT NULL,
    Imie varchar(40)  NOT NULL,
    Nazwisko varchar(40)  NOT NULL,
    IdKraj integer  NULL,
    IdOrganizacja integer  NULL,
    CONSTRAINT Uczestnicy_pk PRIMARY KEY (IdUczestnik)
) ;
GO
-- foreign keys
-- Reference: JezU_JezS (table: JezykiUczestnik)
ALTER TABLE JezykiUczestnik ADD CONSTRAINT JezU_JezS
    FOREIGN KEY (IdJezykS)
    REFERENCES JezykiSlownik (IdJezykS);
GO
-- Reference: Jez_Ucz (table: JezykiUczestnik)
ALTER TABLE JezykiUczestnik ADD CONSTRAINT Jez_Ucz
    FOREIGN KEY (UIdUczestnik)
    REFERENCES Uczestnicy (IdUczestnik);
GO
-- Reference: Miasto_Kraje (table: Miasto)
ALTER TABLE Miasto ADD CONSTRAINT Miasto_Kraje
    FOREIGN KEY (KIdKraj)
    REFERENCES Kraje (IdKraj);
GO
-- Reference: Orgr_Miasto (table: Organizator)
ALTER TABLE Organizator ADD CONSTRAINT Orgr_Miasto
    FOREIGN KEY (MIdMiasto)
    REFERENCES Miasto (IdMiasto);
GO
-- Reference: Orgr_Tem (table: Organizator)
ALTER TABLE Organizator ADD CONSTRAINT Orgr_Tem
    FOREIGN KEY (TIdTemat)
    REFERENCES Tematy (IdTemat);
GO
-- Reference: Tem_Ucz (table: Tematy)
ALTER TABLE Tematy ADD CONSTRAINT Tem_Ucz
    FOREIGN KEY (IdProwadzacy)
    REFERENCES Uczestnicy (IdUczestnik);
GO
-- Reference: Ucz_Kraje (table: Uczestnicy)
ALTER TABLE Uczestnicy ADD CONSTRAINT Ucz_Kraje
    FOREIGN KEY (IdKraj)
    REFERENCES Kraje (IdKraj);
GO
-- Reference: Ucz_Orge (table: Uczestnicy)
ALTER TABLE Uczestnicy ADD CONSTRAINT Ucz_Orge
    FOREIGN KEY (IdOrganizacja)
    REFERENCES Organizacje (IdOrganizacja);
GO
-- End of file.


--=============================================================
--=					        INSERT           	   			  =
--=============================================================

--Dodanie rekordów do tabel
GO
--Kraje  WYKONANE
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('1','Polska');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('2','Niemcy');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('3','Rosja');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('4','Anglia');
INSERT INTO Kraje (IdKraj, Kraj) VALUES ('5','Francja');
GO
--Organizacje
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('1','ONZ');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('2','WWF');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('3','Greenpeace');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('4','Loesje');
INSERT INTO Organizacje (IdOrganizacja, Organizacja) VALUES ('5','ISACA');
GO
--Miasta
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('1','Warszawa','1');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('2','Paryz','5');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('3','Londyn','4');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('4','Petersburg','3');
INSERT INTO Miasto (IdMiasto, Miasto, KIdKraj) VALUES ('5','Berlin','2');
GO
--Jezyki
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (1,'polski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (2,'angielski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (3,'niemiecki');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (4,'francuski');
INSERT INTO JezykiSlownik (IdJezykS, Jezyk) VALUES (5,'rosyjski');
GO
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
GO
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
GO
--Organizator
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (1, ('2009-07-01'), 1, 10);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (2, ('2008-01-03'), 2, 9);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (3, ('2009-07-15'), 2, 8);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (4, ('2008-12-12'), 3, 7);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (5, ('2009-05-01'), 4, 6);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (6, ('2009-04-01'), 5, 5);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (7, ('2008-11-15'), 2, 4);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (8, ('2009-07-03'), 1, 3);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (9, ('2009-12-01'), 2, 2);
INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (10, ('2009-07-02'), 1, 1);
GO
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
GO



--=============================================================
--=					        QUERIES           	   			  =
--=============================================================


--=============================================================
--= Spr czy w wybranym roku i miesi¹cu odbywa siê konferencja =
--=============================================================

CREATE PROCEDURE CheckDate
	(
		@checkData DATE
	)
	AS
	BEGIN
		--sprawdzenie czy w wybranym roku jest juz zorganizowana konferencja
		IF (SELECT COUNT(*) FROM Organizator WHERE YEAR(Data)=YEAR(@checkData) ) != 0
		BEGIN
			IF (SELECT COUNT(*) FROM Organizator WHERE MONTH(Data)=MONTH(@checkData) ) != 0
			BEGIN
				RAISERROR('W tym roku i miesi¹cu organizowana jest ju¿ konferencja',14,1);
			END
		END
	END


GO


--==============================================
--= Spr czy jest czlonek ONZ o podanych danych =
--==============================================
CREATE FUNCTION CheckPerson
	(
		@checkImie VARCHAR(40),
		@checkNazwisko VARCHAR(40)
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE cur CURSOR FOR 
			SELECT Imie, Nazwisko FROM Uczestnicy;
		DECLARE @Imie VARCHAR(40), @Nazwisko VARCHAR(40);

		OPEN cur;
		FETCH NEXT FROM cur INTO @Imie, @Nazwisko;

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @Nazwisko = @checkNazwisko
					BEGIN
						IF @Imie = @checkImie
						BEGIN
							RETURN 1;
						END
					END
				FETCH NEXT FROM cur INTO @Imie, @Nazwisko;
			END
		CLOSE cur;
		DEALLOCATE cur
		RETURN 0;
	END


GO

--=================================
--= Organizacja nowej konferencji =
--=================================
ALTER PROCEDURE CreateConference
	(
		@vData DATE,
		@Temat VARCHAR(40),
		@vImie VARCHAR(40),
		@vNazwisko VARCHAR(40)
	)
	AS
	BEGIN

	--zmienne
	DECLARE @vIdUczestnik INT			--ID dla nowego uczestnika
		--SET @vIdUczestnik = (SELECT COUNT(*) FROM Uczestnicy)+1;
	DECLARE @vIdOrg INT					--ID dla nowej konferencji
		SET @vIdOrg = (SELECT COUNT(*) FROM Organizator)+1;
	DECLARE @vIdTemat INT				--ID dla nowego tematu
		SET @vIdTemat = (SELECT COUNT(*) FROM Tematy)+1;
	DECLARE @vIdJezykiUczestnik INT		--do przypisania jezyka w ktorym mowi nowy uczestnik
		SET @vIdJezykiUczestnik = (SELECT COUNT(*) FROM JezykiUczestnik)+1;
	DECLARE @checkUczestnik INT			--1 jesli uczestnik istnieje lub 0 wpp
		SET @checkUczestnik = (SELECT s19063.CheckPerson(@vImie, @vNazwisko));
	DECLARE @vRandomMiastoId INT		--ID dla nowego tematu
		SET @vRandomMiastoId = (SELECT TOP 1 IdMiasto FROM Miasto ORDER BY NEWID());


	-- Spr czy w wybranym roku i miesi¹cu odbywa siê konferencja
	EXEC CheckDate @checkData=@vData;

	IF @@ERROR <> 0 
		BEGIN
			PRINT('Nie mozesz zaplanowac konferencji w tym terminie');
		END
	ELSE
		BEGIN
	-- Spr czy jest czlonek ONZ o podanych danych
			IF @checkUczestnik = 0
				BEGIN
					--utworzenie nowego uczestnika niezaleznego
					SET @vIdUczestnik = (SELECT COUNT(*) FROM Uczestnicy)+1;
					INSERT INTO Uczestnicy (IdUczestnik, Imie, Nazwisko, IdKraj, IdOrganizacja) VALUES (@vIdUczestnik, @vImie, @vNazwisko, NULL, NULL);
					--PRINT ('Dodano nowego uczestnika. Imie: ' + @vImie + ', Nazwisko: ' + @vNazwisko + ', IdUczestnik: ' + @vIdUczestnik );
					--ktory mowi po angielsku
					INSERT INTO JezykiUczestnik (IdJezykU, UIdUczestnik, IdJezykS) VALUES (@vIdJezykiUczestnik, @vIdOrg, 2);
					--PRINT ('Nowy uczestnik mówi po angielsku.');

				END
			ELSE
				BEGIN
					--przypisanie ID istniejacego uczestnika do zmiennej
					SET @vIdUczestnik = (SELECT IdUczestnik FROM Uczestnicy WHERE Imie=@vImie AND Nazwisko=@vNazwisko);
				END
	
			-- Dodanie nowego tematu do bazy
			INSERT INTO Tematy (IdTemat, Temat, IdProwadzacy) VALUES (@vIdTemat, @Temat, @vIdUczestnik);
			--PRINT ('Dodano nowy temat. Temat: ' + @Temat + ', IdTemat: ' + @vIdTemat );

			-- Zaplanowanie nowej konferencji
			INSERT INTO Organizator (IdOrganizator, Data, MIdMiasto, TIdTemat) VALUES (@vIdOrg, @vData, @vRandomMiastoId, @vIdTemat);

			DECLARE @printMiasto varchar(40)
				SET @printMiasto = (SELECT Miasto FROM Miasto WHERE IdMiasto=@vRandomMiastoId);
			DECLARE @printTemat varchar(40)
				SET @printTemat = (SELECT Temat FROM Tematy WHERE IdTemat=@vIdTemat);

			PRINT ('Now¹ konferencjê zaplanowano w mieœcie: ' + @printMiasto + ' na nastêpuj¹cy temat: ' +  @printTemat);
			END
		END

GO

--=================================================
--= Trigger: jeœli temat ju¿ istnieje to rollback =
--=================================================
ALTER TRIGGER PastKonf
	ON Organizator 
	FOR INSERT  
AS
	BEGIN
		-- spr 
		IF (SELECT Data FROM inserted WHERE IdOrganizator=(SELECT TOP 1 IdOrganizator FROM inserted ORDER BY IdOrganizator DESC)) < GETDATE()
		BEGIN
			RAISERROR('Konferencja nie mo¿e odbywaæ siê w przesz³oœci!',14,1);
			ROLLBACK;
		END
	END


GO  

--=================================
--=         TESTING BELOW         =
--=================================

--CreateConference / Procedura
EXEC CreateConference @vData='2009-07-01', @Temat='Tworzenie bazy danych', @vImie='Slawomir', @vNazwisko='Toczek'; --tej konferencji nie moge zaplanowaæ ze wzglêdu na datê
EXEC CreateConference @vData='2020-07-01', @Temat='Tworzenie bazy danych', @vImie='Slawomir', @vNazwisko='Toczek'; --tê ju¿ mogê
EXEC CreateConference @vData='2021-07-01', @Temat='Tworzenie bazy danych v2', @vImie='Adrian', @vNazwisko='Kabanoski'; --tê konferencjê poprowadzi nowy uczestnik niezale¿ny

--Trigger
EXEC CreateConference @vData='1009-07-01', @Temat='Tworzenie bazy danych', @vImie='Slawomir', @vNazwisko='Toczek'; --tej konferencji nie moge zaplanowaæ ze wzglêdu na datê -> zadzia³a trigger

--Procedura
EXEC CheckDate @checkData='2009-07-01'; --sprawdzenie funkcji czy w danym terminie jest ju¿ zaplanowana konferencja

--Funkcja + kursor
SELECT s19063.CheckPerson('Slawomir','Toczek'); --sprawdzenie czy dana osoba istnieje ju¿ w bazie ->return 1 | 's19063' do zmiany

