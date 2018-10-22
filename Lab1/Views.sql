create view WYCIECZKI_OSOBY as
SELECT
 w.ID_WYCIECZKI,
 w.NAZWA,
 w.KRAJ,
 w.DATA,
 o.IMIE,
 o.NAZWISKO,
 r.STATUS
 FROM WYCIECZKI w
 JOIN REZERWACJE r ON w.ID_WYCIECZKI = r.ID_WYCIECZKI
 JOIN OSOBY o ON r.ID_OSOBY = o.ID_OSOBY
/

create view WYCIECZKI_OSOBY_POTWIERDZONE as
SELECT
 KRAJ, DATA, NAZWA, IMIE, NAZWISKO, STATUS
 FROM WYCIECZKI_OSOBY
where STATUS = 'P'
/

create view "MIEJSCA_ZAJ�TE" as
select 
      R.ID_WYCIECZKI, 
      count(R.ID_WYCIECZKI) AS LICZBA_ZAJETYCH_MIEJSC
FROM REZERWACJE R
WHERE R.STATUS !='A'
Group by R.ID_WYCIECZKI
/

create view WYCIECZKI_MIEJSCA as
SELECT distinct
 w.ID_WYCIECZKI,
 w.KRAJ,
 w.DATA,
 w.NAZWA,
 w.LICZBA_MIEJSC,
 (w.LICZBA_MIEJSC -
 (select
           count(R.ID_WYCIECZKI) AS LICZBA_ZAJETYCH_MIEJSC
FROM REZERWACJE R
WHERE R.STATUS !='A' and w.ID_WYCIECZKI = r.ID_WYCIECZKI
Group by R.ID_WYCIECZKI
)) as liczba_miejsc_wolnych

 FROM WYCIECZKI w
 JOIN REZERWACJE r ON w.ID_WYCIECZKI = r.ID_WYCIECZKI
 JOIN OSOBY o ON r.ID_OSOBY = o.ID_OSOBY
/

create view DOSTEPNE_WYCIECZKI as
select KRAJ, DATA, NAZWA, LICZBA_MIEJSC, ID_WYCIECZKI
FROM WYCIECZKI_MIEJSCA
  WHERE LICZBA_MIEJSC_WOLNYCH>0 AND DATA >SYSDATE
/

create view REZREWACJE_DO_ANULOWANIA as
SELECT
r.ID_WYCIECZKI,
r.NR_REZERWACJI,
r.ID_OSOBY
 FROM WYCIECZKI w
 JOIN REZERWACJE r ON w.ID_WYCIECZKI = r.ID_WYCIECZKI
 JOIN OSOBY o ON r.ID_OSOBY = o.ID_OSOBY
  where r.STATUS='N' and SYSDATE + 7 >=w.DATA
/

create view WYCIECZKI_PRZYSZLE as
SELECT
 KRAJ,DATA,NAZWA,IMIE,NAZWISKO,STATUS
 FROM WYCIECZKI_OSOBY
where STATUS = 'N' and DATA > SYSDATE
/

create view WYCIECZKI_MIEJSCA2 as
SELECT distinct
 w.ID_WYCIECZKI,
 w.KRAJ,
 w.DATA,
 w.NAZWA,
 w.LICZBA_MIEJSC,
 w.LICZBA_WOLNYCH_MIEJSC
 FROM WYCIECZKI w
/

create view DOSTEPNE_WYCIECZKI_2 as
select KRAJ, DATA, NAZWA, LICZBA_MIEJSC, ID_WYCIECZKI
FROM WYCIECZKI_MIEJSCA2
  WHERE LICZBA_WOLNYCH_MIEJSC>0 AND DATA >SYSDATE
/
