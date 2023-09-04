# Write your MySQL query statement below

# PENJELASAN WHERE COALESCE(referee_id, 0) <> 2;
# Ini adalah klausa yang digunakan untuk memfilter data.

# COALESCE(referee_id, 0): Fungsi COALESCE digunakan untuk mengambil nilai pertama yang tidak NULL dari sejumlah argumen. Dalam hal ini, kita memeriksa kolom referee_id. Jika referee_id NULL, maka kita mengambil nilai 0.

# <> 2: Ini adalah operator perbandingan yang berarti "tidak sama dengan 2". Dengan kata lain, kita mencari data di mana nilai referee_id tidak sama dengan 2.

SELECT name FROM Customer
WHERE COALESCE(referee_id, 0) <> 2;