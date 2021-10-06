--Seiten reduzieren durch Kompression

/*
Zeilenkompression
'Otto      'char(50)  -> 'Otto' "varchar"
12345		  --> 12345
Zellewerte komprimieren und dann die 
kleiner gewordenen DS in weniger Seiten zusammenziehen

Seitenkompression
1. Zeilenkompression
2. Präfixkompression

zu erwarten  zwischen 40% bis 60% Kompression
CPU sollte mehr sein

Auswirkungen:

t2 160 MB  20000 Seiten

nach Kompression: weniger
Messung vorher:     20000 Seiten
Messung nachher:    weniger

CPU vorher:  437  1,3 Sekunden
CPU nachher: gleich 


Ramverbrauch vorher: 220  228  + 160 nach ABfrage auf unkomprimiert
Ramverbrauch nachher: weniger wg 33 Seiten

Der Nutzen liegt darin, dass andere mehr Speicher übrig haben

*/
set statistics io, time on
select * from testdb..t3