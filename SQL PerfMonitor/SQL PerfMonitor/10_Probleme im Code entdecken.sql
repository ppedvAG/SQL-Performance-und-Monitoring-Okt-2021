--Problem: Tabellen bwerden ver�ndert: neue Spalte zb

set statistics io on
select * from k1 ----59000 Seiten ca
dbcc showcontig('ku1')  --angeblich nur 46000 Seiten

select * from sys.dm_db_index_physical_stats(
		db_id(),
		object_id('ku1'),
		NULL,
		NULL,
		'detailed'							)
	
--Spalte forward_record_counts
--Anzahl der zus�tzlichen Seiten, in denen die neue Spalte untergbracht wurde

--F�llt nicht direkt offensichtlich auf, auss, dass die Tabelle deutlich mehr Seiten ben�tigt.

--Das Dilema.. es muss nicht sein:
--EIn CLustered Index bringt ein Tabelle immer in eine "sch�n" sortierte pyhsik. Neuordnung
--Die Datens�tze werden nun komplett in einer Seite abgelegt
--und werden, solange es den CL IX gibt auuch immer bleiben..





--Problem : Prozeduren tun nicht das, was sie tun sollten...

/* Prozeuduren sind in der Regel schneller...
allerdings liegt der Grund darin, dass sie keine Zeit Analyse und Kompilierzeit 
"verschwenden". Der Plan wird beim ersten Aufruf festgelegt.

Allersdings wissen wir, dass je nach R�ckgabemenege mal ein Scan mal ein Seek besser ist..

*/
select * into c1 from customers

--LOCKS: Key, Page, Extent, Partition, Tabelle, DB

--je h�her das Sperrniveau, desto mehr DS werden unn�tigerweise 

begin tran

update c1 set City = 'London' where CustomerID = 'ALFKI' --1 DS 

select * from c1 where CustomerID = 'ALFKI'

rollback


select * from sys.dm_os_performance_counters



select * into ku3 from ku1 
GO


create procedure spdemo @Wert int
as
select * from ku3 where ID < @wert
GO


--etwas suboptimal: weil es sicher zu LOOKUP
create nonclustered index nixdemo on ku3 (id asc)
GO

set statistics io on
exec spdemo 2
GO


dbcc showcontig('ku3')
GO 

select * from ku3 where ID < 2 
go 

select * from ku3 where ID < 999999
go 


exec spdemo  2 --ix seek--$ Seiten
GO 10

exec spdemo  999999  --vermuten 43000, sind aber �ber 1 Mio
GO 3 

--Wann legt die Proz den Plan fest..
--beim ersten Aufruf


ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE
--jetzt ist der Plan weg
--jede Proc muss einen neuen Plan machen

exec spdemo  999999  --jetzt neuer Plan... Table Scan


exec spdemo  999999 
GO 2
exec spdemo  2
GO 1







select * from ku1 --59049

dbcc showcontig('ku1') --43907


-----> ID Spalte hinzuf�gten.. zus�tzliche Seiten nur mirt IDs bekommen
--kann man das irgendwo sehen
select 