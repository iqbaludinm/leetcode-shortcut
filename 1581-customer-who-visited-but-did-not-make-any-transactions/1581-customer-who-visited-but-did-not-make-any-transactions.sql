# Write your MySQL query statement below


# PENJELASAN
# Jadi langkah pertama, karena kita ingin mengembalikan customer_id dan count dari setiap customer yang tidak melakukan transactions
# Maka kita select attribute customer_id (hanya ada di tabel Visits)
# Kemudian kita select dgn menggunakan function COUNT terhadap jumlah visit
# Itu kita lakukan terhadap table Visits

# Kita menggunakan LEFT JOIN, karena apa?
# Karena untuk bisa mendapatkan semua data customer dari table Visits, baik yang melakukan transaksi atau hanya sekedar visit
# LEFT JOIN menggunakan kunci yang attribute ada di kedua table yaitu visit_id

# Terus, kita menggunakan WHERE Clause. WHERE disini dipergunakan untuk menghasilkan nilai unique yang ada di table visits (customer_id) yang bernilai NULL atau HAVING COUNT(nama_attribute) = 0;

# Udah deh yg terakhir kita grouping pake GROUP BY Clause. Biasanya GROUP BY Clause ini digunakan waktu kita pernah menggunakan aggregate function kek COUNT, SUM, AVG, dan lain-lain. Ini biasanya agar menghasilkan nilai-nilai unik (dalam hal ini unik untuk nilai customer_id)
# Penggunaan GROUP BY juga tidak boleh asal, attribute yang disematkan pada GROUP BY Clause adalah attribute yang disematkan waktu menuliskan attribute dalam SELECT

SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

# untuk menampilkan nilai yang null tidak bisa menggunakan klausa ini, karena customer_id = 54 tidak 0, dia ada 1 dengan visit_id = 5
# HAVING COUNT(t.transaction_id) = 0; 
