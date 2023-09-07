# Write your MySQL query statement below

# Kita akan menggunakan self join (dapat dipelajari di W3School)
# kueri dari self join itu polanya seperti ini
# SELECT ... FROM table_yang_sama, table_yang_sama WHERE ...

# PENJELASAN
# Jadi itu ceritanya ada 2 table, padahal keduanya salinan dari table yang sama
# kita menggunakan DATEDIFF dengan membandingkan recordDate table 1 dgn table 2 yang hasilnya sama dengan 1. atau artinya kita ingin membandingkan hari ini dengan hari kemarin 

# AND compare terhadap temeperatur dari table 2 dgn table 1. Jadi 'a' ini ditempatkan di id selanjutnya (2) bukan di id sesuai urutan (1)

SELECT a.id 
FROM Weather a, Weather b
WHERE DATEDIFF(a.recordDate, b.recordDate) = 1 
AND a.temperature > b.temperature;
