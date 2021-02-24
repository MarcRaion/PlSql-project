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





