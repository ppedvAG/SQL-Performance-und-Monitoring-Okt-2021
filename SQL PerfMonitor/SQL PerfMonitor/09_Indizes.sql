/* INDIZES


IX sinnvoll bei Abfragen mit where

= < > like 


Im Plan l��t sich das LEseverhalten beonachten


CLUSTERED INDEX Gruppierte Index

kann es nur einmal pro Tabelle geben
= Tabelle  Heap ist weg
in phsikalisch sortierter Form
ideal f�r Bereichsabfrage between > <


NON CLUSTERED INDEX
Kopien von Spaltenwerten in sortierter Reihenfolge mit Zeigern auf das Original
Man kann viele nicht gruppierte IX pro Tabelle
ideal wenn rel wenig rauskommt


SCAN komplettes durchlesen der Strukturen
HEAP: Table SCAN
Non CL  Index: IX SCAN oder IX SEEK evtl mit Lookup

SEEK (nur im Index).. Herauspicken der Ergebniszeilen
CL IX SEEK
Non CL IX Seek


--------------------------------------------->besser
TABLE SCAN/ CL IX SCAN --> IX SCAN --> IX CL IX SEEK

Vermeide Lookup





-----------------------------------
NON CLUSTERED INDEX !
GR IX !


IX mit eingeschlossenen Spalten ! oft um einen idealen Index zu erreichen (1000 SPalten m�glich)

gefilterten IX... nur ein Teil der Daten.. Ziel: weniger Ebenen des Baumes (oft tr�gerisch)

abdeckenden IX ..der ideale IX f�r diese eine Abfrage.kein Lookup aber reiner Seek

partitionierter IX Seiten aufteilen in pyhsikalische Teilchen (wie Tabvellen Partitionierung)
---eigtl �hnlich wie viele gefilterte Indizes

zusammengesetzter IX  ! besteht aus mehr Spalten
	Gesamte Baum besteht aus mehreren Spaltenwerten

ind Sicht ..mit gro�en Einschr�nkungen. Ergebnis der Sicht wird materialisiert
--zwingend eindeutiger Wert, zwingend count_big

realer hypothetischer IX.. den k�nnen wir nicht machen.. Tool
eindeutiger IX  !

----------------------------------------
ColumnStore IX

I UP DEL erst dann fertig, wenn IX aktuell

HEAP ABC  C= 20


ABC ... ca 1000
A
B
C
AB
AC
BA
BC
CA
CB
ABC
ACB
BCA
BAC
CAB
CBA
CBA


Indizes m�ssen gewartet werden
fehlende Indizes finden
�berfl�ssige entfernen

Alle Abfragen des Tages analysieren
--Wo find ich die? 
--QueryStore und Profiler










*/