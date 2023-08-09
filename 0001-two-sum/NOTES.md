# Penjelasan

## Table of Contents

- [Pertanyaan](#pertanyaan)
- [Jawaban](#jawaban)
  - [Jawaban Pertama](#jawaban-pertama)
  - [Jawaban Kedua](#jawaban-kedua)
- [BONUS TIME 🚀🚨🚦🚧🚩](#bonus-time-🚀🚨🚦🚧🚩)

## Pertanyaan 
Singkatnya, pada soal two-sum ini kita disuruh membuat function yang menerima dua parameter berupa nums (berbentuk array/slice) dan target (berbentuk integer). Kemudian, kita disuruh tebak angka target itu berdasarkan elemen-elemen yang ada pada array tsb.

ex: 

`Input: nums = [2,7,11,15], target = 9`

`Output: [0,1]` 

`Penjelasan: Ya karena 9 adalah hasil pertambahan elemen index ke 0 dan 1`

### Constraints
[Terdapat Constraints atau Batasan](./README.md/)


### Tantangan
Lo bisa ga selesain ni soal tapi time-complexity nya kurang dari $O(n^2)$

## Jawaban 

Sebenernya gua udah submit 2 jawaban. [Jawaban Pertama](#jawaban-pertama) dan [Jawaban Kedua](#jawaban-kedua)


### Jawaban Pertama

TC = Time Complexity
```
// PAKE ALGORITMA BRUTE FORCE atau O(n^2)

func twoSum(nums []int, target int) []int {
	var temp []int
	for idxI, i := range nums {   -> TC = O(n)....1
		for idxJ, j := range nums {   -> TC = O(n)....2
			if i + j == target && idxI != idxJ {
				temp = append(temp, idxI, idxJ)
				return temp
			}
		}
	}
	return temp
}
```

**BACA ALUR:**

1. Looping pertama buat ngeloop seluruh array tapi untuk satu element
2. Looping kedua buat ngeloop seluruh element didalamnya dengan mengombinasikan satu element dari looping pertama
3. Ibaratnya permutasi, looping pertama = 1 looping kedua 1, 2, 3
4. Jadi if disitu jika `i+j` maksudnya adalah jika 1+1, 1+2, atau 1+3 apakah sama dengan target kita

**PENJELASAN**:

Kode diatas itu time-complexity nya sebesar $O(n^2)$. Kenapa bisa gitu? Coba lo liat TC ke-1, disitu ada looping. 

Pada dasarnya looping itu memakan waktu $O(n)$. Kenapa bisa looping = $O(n)$. Ya karena proses itu akan memakan waktu sebanyak n kali atau sebanyak banyaknya element. MIKIR! 

Analoginya, lo lagi di kantin dan mau cari harga makanan yang murah. Yaa mau gamau pilihannya antara lo liatin menu tu masing-masing toko atau tanya 1 per 1. Terlepas dari dua itu ya intinya kan lo bakal cari tau ke masing-masing kantin. Jadi?

Jadi, ya lo bakal cari tau sebanyak jumlah toko-toko yang ada di kantin itu atau sama dengan lo ngulang-ngulang pertanyaan yang sama disetiap toko. Itulah mengapa looping memiliki time-complexity = $O(n)$

Kesimpulan:

Time Complexity dari kode diatas sebesar $O(n^2)$ karena $O(n)$ x $O(n)$ alias loop dalam loop

**Hasil Compile Kode Jawaban Pertama:**

`Time: 51 ms (10.52%), Space: 3.7 MB (85.64%)`

### Jawaban Kedua

Nah, ini jawaban kedua kudu optimasi. Karena biasanya dalam technical test, kita dihadapkan suatu case - kerjain - ditanya time and space complexitynya - bisa dioptimasi lagi ga? (kadang, tapi biasanya ada aja begini)

```
// PAKE ALGORITMA HASH MAP

func twoSum(nums []int, target int) []int {
    temp := make(map[int]int)
	for i := 0; i < len(nums); i++ {    -> TC = O(n)....1
		complement := target - nums[i]    -> TC = O(1)....2
		if value, exist := temp[complement]; exist {
			return []int{value, i}
		}
		temp[nums[i]] = i
	}
	return []int{}
}
```

**BACA ALUR:**

Berikut langkah-langkah algoritma dalam kode tersebut:

Mari kita jalankan algoritma Two Sum dengan masukan nums = [2, 7, 11, 15] dan target = 9.

1. Kita membuat objek map yang awalnya kosong untuk menyimpan angka-angka dan indeksnya.
2. Iterasi dimulai dengan nilai i sama dengan 0, karena array berindeks dari 0.
3. Pada iterasi pertama, nums[0] adalah 2. Hitung complement dengan mengurangkan target (9) dengan angka saat ini (2), sehingga complement = 7.
4. Periksa apakah complement (7) sudah ada dalam objek map. Karena objek masih kosong, complement belum ditemukan.
5. Masukkan angka saat ini (nums[0] = 2) dan indeksnya (0) ke dalam objek map, sehingga map menjadi: { 2: 0 }.
6. Pindah ke iterasi berikutnya dengan i = 1. Pada iterasi ini, nums[1] adalah 7. Hitung complement dengan mengurangkan target (9) dengan angka saat ini (7), sehingga complement = 2.
7. Periksa apakah complement (2) sudah ada dalam objek map. Karena complement sudah ada dalam objek, kita telah menemukan pasangan angka yang jumlahnya sama dengan target (9). Kembalikan indeks dari angka complement (2) dan indeks saat ini (1) dalam bentuk array [map[complement], i], yang dalam hal ini adalah [0, 1].
8. Selesai. Algoritma mengembalikan hasil [0, 1], yang berarti angka pada indeks 0 dan 1 dari array nums (yaitu 2 dan 7) memiliki jumlah 9, sesuai dengan target yang ditentukan..

**PENJELASAN:**

Kode diatas itu punya time-complexity sebesar $O(n)$, KOK BISA? Ya bisalah

- Nih lo liat TC ke-1. Disitu ada loop jadi TCnya $O(n)$

- Nah pada setiap iterasi loop, operasi `complement := target - nums[i]` memiliki kompleksitas waktu $O(1)$, **karena hanya melibatkan operasi aritmatika sederhana.**

- Terus pada setiap iterasi loop, operasi `if value, exist := temp[complement]; exist` juga memiliki kompleksitas waktu $O(1)$, **karena map temp digunakan untuk melakukan pencarian dengan waktu konstan.**

- Terakhir pada setiap iterasi loop, operasi `temp[nums[i]] = i` juga memiliki kompleksitas waktu $O(1)$, **karena operasi penambahan atau pembaruan elemen dalam map juga memiliki waktu konstan.**

Kesimpulan:

Jadi, $O(log n)$ dioperasi pengurangan `complement := target - nums[i]` ini tidak berlaku dikarenakan itu hanya pengurangan b aja. 

Time Complexity dari kode diatas sebesar $O(n)$ karena $O(n)$ x $O(1)$ x $O(1)$ x $O(1)$ = $O(n)$


**Hasil Compile Kode Jawaban Kedua:**

`Time: 3 ms (95.46%), Space: 4.3 MB (13.87%)`

---

## BONUS TIME 🚀🚨🚦🚧🚩


### BAGAIMANA CARA MENGHITUNG KOMPLEKSITAS WAKTU DARI SUATU CODE ?

CARANYA GAMPANG. Lo tinggal cari tau maksud dari kode lo. Gini gini, gue jelasin teorinya dulu. 

Sebenernya kompleksitas waktu atau time complexity ini terbagi menjadi 3 bagian (berdasarkan buku cracking the code interview di Bab VI - Big O), tapi umumnya itu ada 2 Notasi Big O $(O)$ dan Notasi Big Theta $(Θ)$ (kalo ada 3 satunya Big Omega)

- Notasi Big O $(O)$ 

  Notasi Big O digunakan untuk menggambarkan batas atas dari kompleksitas waktu algoritma. Notasi ini memberikan informasi tentang seberapa cepat algoritma tersebut tumbuh relatif terhadap ukuran masukan (n). Misalnya, jika kompleksitas waktu suatu algoritma adalah O(n), itu berarti waktu eksekusi algoritma akan tumbuh secara linier dengan ukuran masukan n.

- Notasi Theta $(Θ)$

  Notasi Theta memberikan batas atas dan batas bawah yang sama dari kompleksitas waktu algoritma. Ini memberikan gambaran yang lebih tepat tentang waktu eksekusi algoritma. Misalnya, jika kompleksitas waktu suatu algoritma adalah Θ(n^2), itu berarti waktu eksekusi algoritma akan tumbuh secara kuadrat dengan ukuran masukan n.

Untuk menghitung kompleksitas waktu suatu kode, Anda perlu melihat bagaimana jumlah langkah eksekusi kode tersebut berkembang saat ukuran masukan meningkat. Anda bisa menghitung jumlah operasi dasar (misalnya, loop, kondisi, operasi aritmatika) yang dieksekusi oleh kode tersebut dalam fungsi notasi Big O atau Theta.

**CHEAT SHEET**

![Big O Cheat Sheet FCC](./img/big-o.png)

- $O(1)$ : Constant (biasanya operasi mtk sederhana, console.log / print out, penambahan atau pembaruan elemen ke array, dll)
- $O(n)$ : Linear Time (biasanya looping)
- $O(n \ log \ n)$ : Logaritmik Time (biasanya dioperasi mtk yang tumbuh secara eksponensial (i*2), pembagian, dll) 
- $O(n^2)$ : Kuadratik Time (biasanya loop dalam loop)
- $O(n^3)$ : Kubik Time
- $O(2^n)$ : Eksponensial Time
- $O(n!)$ : Factorial Time

*Catatan: Urutan list big O diatas menunjukkan nilai dari terkecil hingga terbesar*