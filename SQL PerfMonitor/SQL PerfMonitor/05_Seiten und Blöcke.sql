/*
SQL Server speichert Datensätze in sog Seiten
Mehrere Seiten ergeben einen Block

1 Seite hat eine Volumen von 8192 bytes  8kb
1 Block besteht aus 8 zusammenhängenden Seiten
1 Seite kann nicht mehr als 700 Datensätze entalten
1 Seiten hat allerdings auch nur 8072 bytes Nutzlast
1 Datensatz kann in einer Seite nie größer sein als 8060 bytes

Alle Seiten werden von HDD direkt 1:1 in RAM geschoben..
Der Verlust (der frei nicht verwednete Platz) geht 1 zu 1 in RAM

1 DS in t2 hatte eben 4100 bytes

*/

create table t4 (id int, sp1 char(4100), sp2 char(4100))


--io = Anzahl der Seiten, time Gesmate Dauer in ms und CPU in ms
set statistics io, time on

select * from t3 --- logische Lesevorgänge: 20000!!!!! 160MB in RAM


--Oberste Ziel:
--weniger IO !!!!! weniger Seiten

--je mehr Seiten, desto mehr RAM, desto mehr CPU


--Woher weiss ich das??

dbcc showcontig('t3')
dbcc showcontig()

--- Gescannte Seiten.............................: 20000
--- Mittlere Seitendichte (voll).....................: 72.79% (97%) ..99


--CRM: 2000 Spalten...
--Fax1 Fax2 Fax3 Frau1 Frau2 Frau3 Frau4 Religion


 1Mio DS a 4100 = 8GB Platz (Hdd und Ram)
 1 Mio a 4000 + 1 Mio a 100
    4GB            12500*8kb=110MB= 4,1GB HDD und RAM

