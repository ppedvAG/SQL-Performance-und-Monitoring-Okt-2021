---Idee: 

/*
A uznd B sind identisch
TAB A: 10000
TAB B  100000

Abfrage Ergebis 3 Zeilen (A B)

Welche wird schneller Eregbnisse liefern: A


*/

---part Sicht

--statt Umsatztabelle eine U2021 U2020 U2019 usw..
--Aber es muss das gehen: select * from umsatz muss funktionieren


create table u2021 (id int identity, jahr int, spx int)
create table u2020 (id int identity, jahr int, spx int)
create table u2019 (id int identity, jahr int, spx int)
create table u2018 (id int identity, jahr int, spx int)

select * from umsatz


create view umsatz
as
select * from u2021
UNION ALL --keine Suche nach doppelte Zeilen
select * from u2020
UNION ALL
select * from u2019
UNION ALL
select * from u2018


select * from umsatz where jahr = 2019-- ist das schneller?

--TÜV Siegel
--CHECK Constraint .. Einschränkungen
ALTER TABLE dbo.u2018 ADD CONSTRAINT
	CK_u2018 CHECK (jahr=2018)

--jetzt scan über alle wieder
select * from umsatz where id= 2019

--Nachteile: wenn eine Spalte einen identity Wert besitzt
		--   wenn der PK nur auf der ID ist, dann
		--kein Insert
		--der PK muss in jeder Tabell auf ID und Jahr gesetzt werden

--besser: Partitionierung


------------100-----------------200--------------------------------- int
-- 1                  2					3


--  HDD1         HHD2                    HDD3



--Dateigruppe... Alias für Pfad und Datei


create table txy (id int) --liegt auf mdf

create table txy(id int) on dateigruppe

create table txy (id int) on HOT

---Für Part: F() Verteilungschlüssel
-- f(117) --> 2
-- Part Schema... die 2?= das ist die Dgruppe: bis200


--lege 4 Dateigruppen an
--bis100
--bis200
--bis5000
--rest

USE [master]
GO
ALTER DATABASE [testdb] ADD FILEGROUP [bis100]
GO
ALTER DATABASE [testdb] ADD FILE ( NAME = N'bis100daten', FILENAME = N'D:\_SQLDB\bis100daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis100]
GO
ALTER DATABASE [testdb] ADD FILEGROUP [bis200]
GO
ALTER DATABASE [testdb] ADD FILE ( NAME = N'bis200daten', FILENAME = N'D:\_SQLDB\bis200daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis200]
GO
ALTER DATABASE [testdb] ADD FILEGROUP [bis5000]
GO
ALTER DATABASE [testdb] ADD FILE ( NAME = N'bis5000daten', FILENAME = N'D:\_SQLDB\bis5000daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis5000]
GO
ALTER DATABASE [testdb] ADD FILEGROUP [rest]
GO
ALTER DATABASE [testdb] ADD FILE ( NAME = N'restdaten', FILENAME = N'D:\_SQLDB\restdaten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [rest]
GO



--Part Funktion
--------------------100---------200---------------------
--1                           2                3

create partition function fzahl(int)
as
RANGE LEFT FOR VALUES (100,200)
--Tipp: man kann 15000 Bereiche machen

create partition scheme schZahl
as
partition fzahl to (bis100,bis200,rest)--wird kontrolliert
--                     1     2     3

create table parttab(id int identity, spx char(4100), nummer int)
ON schZahl(nummer)
set statistics io , time off

declare @i as int=0
begin tran
while @i<=20000
	begin
		insert into parttab values ('xy', @i)
		set @i=@i+1
	end
commit

--Ist das schneller?
set statistics io, time on
select * from parttab --20000 Seiten

select * from parttab where nummer = 117 --0ms bei 100 Seiten

select * from parttab where id = 117 --20000 Seiten



--Manipulierbar
--neue Grenze 5000
-------------100---------200----------------------5000-------------
--   1			2				3							4

--eine Dgruppe (bis5000)
--f(), schema
--
alter partition scheme schZahl next used bis5000

select $partition.fzahl(nummer), min(nummer),max(nummer), count(*)
from parttab group by  $partition.fzahl(nummer)

--create drop alter
--zuerst schema
alter partition function fzahl() split range(5000)
--Tipp: man kann 15000 Bereiche machen

-------------x100x---------------200------------5000--

--Grenze entfernen: 100
--F()

alter partition function fzahl() merge range(100)

select * from parttab where nummer = 9134


---Kombination..
--auch Kompression von part geht....






--geht auch nmit Datum, oder Text

--Jahresweise: 2020 2021 usw
create partition function fzahl(datetime)--Achtung ms
as
RANGE LEFT FOR VALUES ('31.12.2019 23:59.59.999','',...)

-----------2019]------2020---2021-----------


--Kunden
--A bis M      N bis R      S bis Z

-------------------M]
create partition function fzahl(varchar(50))--Achtung ms
as
RANGE LEFT FOR VALUES ('N','')

--
--Sperrniveau wird : auch kleiner pro Part