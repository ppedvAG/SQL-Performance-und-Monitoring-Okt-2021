--Setup:

/*
Pfade f�r DBs
DB bestehen aus:
mdf Master data File
ldf log data file
ndf Dateien Dateien 

--> trenne Log von Daten!!!!!!!!! physikalisch (mehr Hdds)
das Logfile will ungest�rt schreiben k�nnen






--Daten und Logfiles

ab sql 2016 im Setup:

tempdb
nur einmal pro SQL Instanz
IX Erstellung
#tabellen
Auslagerungen
Zeilenversionierung
Idee: eig HDDs .. trenne Log und Daten

Anzahl der DatenDateien = Anzahl der Prozessoren (Max 8)
T 1118 alle Dateien gleich gro�

T 1119 keinen gemischten Bl�cke sondern uniform extent
		keine wartende Threads wg ZUghriff auf denselben Block

Startparameter

Kontrolliere ob die tempdb soviele DAteien wie Proz hat
und ob alle Dateien gleich gro�







RAM 
ber�cksichtige das Windows OS: 2 bis 4 GB mindestens
Min: der Min Speicher z�hlt erst wenn belegt...
Max: maximale Grenze f�r Daten ..sollte man setzen
2,1 PB


MAXDOP
Wieviele CPUs verwendet der SQL f�r eine Abfrage?
Entweder 1 oder alle per default
Wann 1 und wann alle? Je nach SQL Dollar?
Wen die Kosten �ber 5 Dollar gehen ,dann alle CPUs?
Idee: Ist es ok mehr CPUs einzusetzen
Default: ab 5 SQL Dollar .. MAXDOP: 0

Std Tipp: Kostenschwellwert statt 5 eher 25
Anzahl der CPUs evtl nochmal reduzieren von 8 auf 4 oder 6


Resultat: in gleicher Zeit mit weniger Aufwand
--CPUs frei


--Seit SQL 1016 kann dieser Wert MAXDOP
--auch pro DB festgelegt

je n�her der Wert an der abfrage eingestellt wurde
desto eher z�hlt dieser

Server--> DB--> Abfrage
8           4       -   --> 4
16           0      2   --> 2




  







Datentr�gervolumewartungstask??
Windows Funktion Securityfeatures

----------------------
1111111111111111
----------------------

dann kann SQL Server eig die DAtei ohne auszunullen vergr��ern

bei einem guten Admin ist das rel egal...!




Security






*/