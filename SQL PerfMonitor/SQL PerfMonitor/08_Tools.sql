--Tool...

--Tool1:
--QueryStore.. das dauerhaft (auch Neustart) 
--Abfragen werden gespeichert mit Messdaten und Pl�nen
--pro DB aktivieren


--Tool2: Perfmon-- grafisch -> Spitzenlast

-- Tool3: Profiler

Aufzeichnung von SQL Statements

unbedingt Filtern
SP Statement Completet (ST Proc)
auf "anderen" HDD speicher
Beedigungszeit


DMVs
Systemsichten

select * from sys.dm_db_index_physical_stats
	(DB_ID(),OBJECT_ID('ku1'),NULL,NULL,'detailed')

--forward_record_count d�rften nicht vorkommen
--wir m�ssen die Tabelle physikalisch neu ablegen
--CL IX L�sung

--Frag den SQL Server wo es weh tut
select * from sys.dm_os_wait_stats order by 3 desc

---QUERY--> Worker (untersucht Ressource)---------> Ress Parat|--->CPU|
--------------------------------------------------------------------->gesamt Wartezeit
															  |------->Signalzeit


              SUSPENDED  LCK_M_S                      RUNNABLE    RUNNING

--falls die Signalzeit > 25% w�re, dann CPU Engpass
--dumm ist nur.. die Werte werden addiert seit dem Neustart
--dumm ist auch: kein zeitlicher verlauf
		--> regelm wegschreiben
		-15 Uhr SOS 134  15:10 138  15:20 324

--Liveprobleme
--Aktivit�tsmonitor
--Datamanagementviews select * from sys.dm_os-- SQL Server System
--                                  sys.dm_db_ Datenbank


--Aufzeichnung
/*
Perfmon.. grafische Analyse.. sehr detailiert, wenig aufwendig
--> aber keine Aussage �ber Ursache im SQL Code (wer wann wo was..)

Profiler.. aufwendiges Aufzeichnen, daf�r sehr detailiert
	--> evtl sparsam umgehen (Filter setzen)

Perfmomn und Profiler lassen sich �bereinander legegen
--geht allerdings nur im Profiler, wenn eine Aufzeichnug geladen wurde
--> Datei: Leistungsdaten importieren


Datensammler..
kann die Arbeit abnehmen, belastte aber den SQL Server
cool.. grafische Auswertungm die sehr detailiert werden k�nnen


XVents.. eher f�r Profies.. Aufzeichung wie Profiler
mit verschiedenen M�glichkeiten (histogramm, Ring_buffer)
lightweight.. aber Auswertung im Vergleich mit Perfmon: no


Query Store. Zeichnet lightweight ABfragen auf und beh�lt diese nach eingestellter Regel
in der DB. Muss allerdings vorher aktiviert werden


Sehr gut.. auch nach Neustart alles noch da.. Auffinden derteuersten Abfrage sehr easy...
Seit SQL 2016









*/










