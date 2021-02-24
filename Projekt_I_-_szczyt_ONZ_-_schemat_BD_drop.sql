-- foreign keys
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

-- End of file.

