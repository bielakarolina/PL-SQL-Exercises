create TYPE pojedyncza_rezerwacja AS OBJECT(
  IMIE VARCHAR2(50),
  NAZWISKO VARCHAR2(50),
  STATUS CHAR(1),

  ID_WYCIECZKI NUMBER,
  NAZWA VARCHAR2(100),
  KRAJ VARCHAR2(50),
  DATA DATE

)
/

create TYPE POJEDYNCZA_WYCIECZKA AS OBJECT(
  KRAJ VARCHAR2(50),
  DATA DATE,
  NAZWA VARCHAR2(50),
  LICZBA_MIEJSC NUMBER,
  ID_WYCIECZKI NUMBER
)
/
