--DB Design:

/*
Indizes
Schl�ssel PK --> FK Referenzen
Normalsierung spart Platz
Normalformen

Redundanz ist schnell

Datentypen


Diagramm

Versus

Architektur Seiten und Bl�cke

Tabelle 
Sp1  char(4100)  --fixe L�nge
Sp2  varchar(50)  --variable lang

Otto
char(100) ..100
varchar(100)...4
nchar(100)...100*2
nvarchar(100)..4*2


Datum
datetime ...  ms
smalldatetime ... sek
datetimeoffset ...ms plus Zeitzone
datetime2  ..ns
time date ... Zeit und Datum


int ganze Zahl
money 8 Nachkommastellen
decimal(5,2)  5 Stellen davon 2 Nachkommastellen





1 Mio DS

select 1000000*4kb= 4 GB--> Fakt : 8 GB trotz 4 GB Daten auf HDD und auch im RAM

wie gro0� ist die Tabelle in MB: 





*/

create table t3 (id int identity,sp1 char(4100))

insert into t3
select 'XY'
GO 20000 --25 Sekunden...20 Sekunden

--Gr��e der Tabelle: 20000 * 4kb = 80 MB.. ist aber 160MB!!