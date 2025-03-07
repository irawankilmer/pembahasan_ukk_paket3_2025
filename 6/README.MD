# **Materi 6: Pencarian dan Penyaringan Data dengan Query SQL**

## **Pendahuluan**

Sekarang kita masuk ke tahap di mana kita **menyaring dan mencari data secara spesifik** dalam tabel database. Bayangkan database seperti sebuah perpustakaan besar 📚. Jika kita ingin mencari buku berdasarkan **judul, penulis, atau tahun terbit**, kita perlu menggunakan **filter** agar hasil pencarian lebih cepat dan akurat.

Di SQL, filter ini dilakukan dengan **WHERE, ORDER BY, IN, BETWEEN, LIKE**, dan lainnya. Mari kita bahas satu per satu! 🚀

---

## **1️⃣ WHERE – Menyaring Data Sesuai Kondisi**

Perintah **WHERE** digunakan untuk **memfilter data berdasarkan kriteria tertentu**. Tanpa **WHERE**, SQL akan menampilkan seluruh data.

### **➤ Contoh: Menampilkan siswa di kelas '12 RPL'**
```sql
SELECT * FROM siswa WHERE kelas = '12 RPL';
```
📌 **Hanya siswa dengan kelas '12 RPL' yang ditampilkan.**

### **➤ Menggunakan Operator Perbandingan**
| Operator | Keterangan |
|----------|------------|
| `=` | Sama dengan |
| `!=` atau `<>` | Tidak sama dengan |
| `>` | Lebih besar |
| `<` | Lebih kecil |
| `>=` | Lebih besar atau sama |
| `<=` | Lebih kecil atau sama |

📌 **Contoh:**
```sql
SELECT * FROM siswa WHERE tanggal_lahir > '2005-01-01';
```
Menampilkan siswa yang lahir setelah **1 Januari 2005**.

---

## **2️⃣ ORDER BY – Mengurutkan Data**

Perintah **ORDER BY** digunakan untuk **mengurutkan hasil pencarian** secara **ascending (A-Z, 0-9)** atau **descending (Z-A, 9-0).**

### **➤ Contoh: Urutkan siswa berdasarkan nama dari A-Z**
```sql
SELECT * FROM siswa ORDER BY nama ASC;
```
📌 **ASC** = Urutan naik (default), **DESC** = Urutan turun.

### **➤ Contoh: Urutkan siswa berdasarkan umur (tanggal lahir paling tua duluan)**
```sql
SELECT * FROM siswa ORDER BY tanggal_lahir ASC;
```

📌 Bisa juga mengurutkan berdasarkan **lebih dari satu kolom**:
```sql
SELECT * FROM siswa ORDER BY kelas DESC, nama ASC;
```
Menampilkan **kelas terbesar duluan**, dalam kelas yang sama **nama urut A-Z**.

---

## **3️⃣ IN – Memilih Data dari Sekumpulan Nilai**

**IN** digunakan jika kita ingin mencari **beberapa nilai spesifik tanpa harus menulis banyak OR**.

### **➤ Contoh: Cari siswa dari kelas '10 TKJ', '11 TKJ', atau '12 TKJ'**
```sql
SELECT * FROM siswa WHERE kelas IN ('10 TKJ', '11 TKJ', '12 TKJ');
```
📌 **Lebih singkat dibandingkan menggunakan banyak `OR`**:
```sql
SELECT * FROM siswa WHERE kelas = '10 TKJ' OR kelas = '11 TKJ' OR kelas = '12 TKJ';
```

---

## **4️⃣ BETWEEN – Mencari Data dalam Rentang Nilai**

**BETWEEN** digunakan untuk mencari data dalam **rentang angka atau tanggal**.

### **➤ Contoh: Cari siswa lahir antara 1 Januari 2005 - 31 Desember 2006**
```sql
SELECT * FROM siswa WHERE tanggal_lahir BETWEEN '2005-01-01' AND '2006-12-31';
```
📌 **BETWEEN selalu mencakup kedua batas angka/tanggal yang disebutkan.**

### **➤ Contoh: Cari siswa dengan nilai antara 75 dan 90**
```sql
SELECT * FROM nilai WHERE nilai BETWEEN 75 AND 90;
```
📌 Menampilkan siswa dengan nilai antara **75 sampai 90**.

---

## **5️⃣ LIKE – Mencari Data dengan Pola Tertentu**

**LIKE** digunakan untuk mencari teks yang **mirip** dengan pola tertentu, menggunakan **wildcard (`%` dan `_`)**.

| Simbol | Keterangan |
|--------|------------|
| `%` | Mengganti banyak karakter |
| `_` | Mengganti satu karakter |

### **➤ Contoh: Cari siswa yang namanya diawali huruf 'A'**
```sql
SELECT * FROM siswa WHERE nama LIKE 'A%';
```
📌 **% berarti bisa diikuti karakter apa saja**.

### **➤ Contoh: Cari siswa dengan nama yang mengandung 'ri'**
```sql
SELECT * FROM siswa WHERE nama LIKE '%ri%';
```
📌 Menampilkan **semua nama yang memiliki kata 'ri' di dalamnya**, seperti **Rizky, Arif, Sri**.

### **➤ Contoh: Cari siswa dengan nama yang berakhiran 'an'**
```sql
SELECT * FROM siswa WHERE nama LIKE '%an';
```
📌 Mencari **nama yang berakhiran 'an'**, seperti **Herman, Iwan, Sulthan**.

### **➤ Contoh: Cari siswa dengan nama 5 huruf, huruf ke-3 adalah 'r'**
```sql
SELECT * FROM siswa WHERE nama LIKE '__r__';
```
📌 **Tanda `_` menggantikan satu karakter**.

---

## **6️⃣ Kombinasi WHERE dengan AND & OR**

Kita bisa menggabungkan beberapa kondisi dengan **AND** atau **OR**.

### **➤ Contoh: Cari siswa kelas '12 RPL' yang lahir setelah 2005**
```sql
SELECT * FROM siswa WHERE kelas = '12 RPL' AND tanggal_lahir > '2005-01-01';
```
📌 **AND** = Semua kondisi harus terpenuhi.

### **➤ Contoh: Cari siswa yang kelasnya '12 RPL' atau '11 TKJ'**
```sql
SELECT * FROM siswa WHERE kelas = '12 RPL' OR kelas = '11 TKJ';
```
📌 **OR** = Salah satu kondisi saja cukup.

---

## **Kesimpulan**

🔥 **WHERE** → Memfilter data berdasarkan kondisi tertentu.
🔥 **ORDER BY** → Mengurutkan data (ASC/DESC).
🔥 **IN** → Memilih beberapa nilai tertentu.
🔥 **BETWEEN** → Mencari data dalam rentang nilai.
🔥 **LIKE** → Mencari pola teks dengan wildcard `%` dan `_`.
🔥 **AND/OR** → Menggabungkan beberapa kondisi filter.

📌 **Singkatnya:**
- **WHERE** = "Saya hanya mau yang ini!" 🎯
- **ORDER BY** = "Urutkan dari yang terbaik!" 📊
- **IN** = "Cuma ambil yang ada di daftar ini!" ✅
- **BETWEEN** = "Cari dalam rentang tertentu!" 📏
- **LIKE** = "Cocokkan pola katanya!" 🔍

Semoga materi ini mudah dipahami! Jika ada pertanyaan, tanya saja! 😊🚀



---
### **Navigasi**
Prev ⏮ [Materi 5: Definisi Relasi Antar Tabel](../5/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 7: Fungsi Agregat dan Grouping Data](../7/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606