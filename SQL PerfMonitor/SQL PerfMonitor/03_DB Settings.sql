create database testdb

/*
wieviele Fehler haben wir eben gemacht?

Größe der DB?
Standardgröße: 8 Daten + 8 Logfile
Wachstumsrate: 64MB       64 MB ..nicht viel besser
SQL 2014        1MB       10%.. irre!
*/
use testdb

select * into t1 from Northwind.dbo.kundeumsatz --7 Sekunden

select * into t2 from Northwind.dbo.kundeumsatz --4 Sekunden

select 360*3

--Größe des Logfiles:  Beim Logfile ca 25 % der Datendatei
--Vergrößerung: 64MB

--jedes Logfiles hat Virt Logfiles

--wenn man um 10 MB vergößert, dann 10 VLF
--wenn man um 100 MB vergrößert dann auch 10 VLF
--Ziel: rel  wenige VLF.. maximal 3000 / 6000 VLF

--Wachstum der Logiles: 1000MB


--F()

select fbrutto(dynmisch)---119

dbcc loginfo('testdb')
--










*/