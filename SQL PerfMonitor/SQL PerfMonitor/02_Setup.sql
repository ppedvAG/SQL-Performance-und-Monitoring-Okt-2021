--Setup:

/*
Pfade für DBs
DB bestehen aus:
mdf Master data File
ldf log data file
ndf Dateien Dateien 

--> trenne Log von Daten!!!!!!!!! physikalisch (mehr Hdds)
das Logfile will ungestört schreiben können






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
T 1118 alle Dateien gleich groß

T 1119 keinen gemischten Blöcke sondern uniform extent
		keine wartende Threads wg ZUghriff auf denselben Block

Startparameter

Kontrolliere ob die tempdb soviele DAteien wie Proz hat
und ob alle Dateien gleich groß







RAM 
berücksichtige das Windows OS: 2 bis 4 GB mindestens
Min: der Min Speicher zählt erst wenn belegt...
Max: maximale Grenze für Daten ..sollte man setzen
2,1 PB


MAXDOP
Wieviele CPUs verwendet der SQL für eine Abfrage?
Entweder 1 oder alle per default
Wann 1 und wann alle? Je nach SQL Dollar?
Wen die Kosten über 5 Dollar gehen ,dann alle CPUs?
Idee: Ist es ok mehr CPUs einzusetzen
Default: ab 5 SQL Dollar .. MAXDOP: 0

Std Tipp: Kostenschwellwert statt 5 eher 25
Anzahl der CPUs evtl nochmal reduzieren von 8 auf 4 oder 6


Resultat: in gleicher Zeit mit weniger Aufwand
--CPUs frei


--Seit SQL 1016 kann dieser Wert MAXDOP
--auch pro DB festgelegt

je näher der Wert an der abfrage eingestellt wurde
desto eher zählt dieser

Server--> DB--> Abfrage
8           4       -   --> 4
16           0      2   --> 2




  







Datenträgervolumewartungstask??
Windows Funktion Securityfeatures

----------------------
1111111111111111
----------------------

dann kann SQL Server eig die DAtei ohne auszunullen vergrößern

bei einem guten Admin ist das rel egal...!




Security






*/