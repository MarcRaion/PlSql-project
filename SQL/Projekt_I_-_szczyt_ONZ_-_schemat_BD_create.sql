-- tables
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

-- End of file.

