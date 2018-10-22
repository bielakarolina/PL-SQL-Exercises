create table WYCIECZKI
(
	ID_WYCIECZKI NUMBER generated as identity
		constraint WYCIECZKI_PK
			primary key,
	NAZWA VARCHAR2(100),
	KRAJ VARCHAR2(50),
	DATA DATE,
	OPIS VARCHAR2(200),
	LICZBA_MIEJSC NUMBER,
	LICZBA_WOLNYCH_MIEJSC NUMBER
)
/

create table OSOBY
(
	ID_OSOBY NUMBER generated as identity
		constraint OSOBY_PK
			primary key,
	IMIE VARCHAR2(50),
	NAZWISKO VARCHAR2(50),
	PESEL VARCHAR2(11),
	KONTAKT VARCHAR2(100)
)
/

create table REZERWACJE
(
	NR_REZERWACJI NUMBER generated as identity
		constraint REZERWACJE_PK
			primary key,
	ID_WYCIECZKI NUMBER
		constraint REZERWACJE_FK2
			references WYCIECZKI,
	ID_OSOBY NUMBER
		constraint REZERWACJE_FK1
			references OSOBY,
	STATUS CHAR
		constraint REZERWACJE_CHK1
			check (status IN ('N','P','Z','A'))
)
/


create table REZERWACJE_LOG
(
	ID NUMBER generated as identity
		constraint REZERWACJE_LOG_PK
			primary key,
	NR_REZERWACJI NUMBER
		constraint REZERWACJE_LOG_FK
			references REZERWACJE,
	DATA DATE,
	STATUS CHAR
)
/
