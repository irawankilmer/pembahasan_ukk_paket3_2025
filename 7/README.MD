# **Materi 7: Fungsi Agregat dan Grouping Data**

## **Pendahuluan**

Di dunia nyata, kita sering melakukan **perhitungan terhadap kumpulan data**. Misalnya:
✅ Menghitung total penjualan 💰
✅ Mengetahui rata-rata nilai siswa 📊
✅ Mencari harga barang termurah dan termahal 🛒

Di SQL, kita bisa melakukan perhitungan ini dengan **fungsi agregat**, lalu **mengelompokkan data** menggunakan **GROUP BY** dan menyaring hasilnya dengan **HAVING**. Mari kita bahas satu per satu! 🚀

---

## **1️⃣ Fungsi Agregat dalam SQL**
Fungsi agregat digunakan untuk **melakukan operasi matematika pada kumpulan data**. Berikut beberapa fungsi utamanya:

| **Fungsi** | **Kegunaan** |
|-----------|-------------|
| **SUM()** | Menjumlahkan semua nilai dalam satu kolom |
| **AVG()** | Menghitung rata-rata nilai dalam satu kolom |
| **COUNT()** | Menghitung jumlah baris yang sesuai kriteria |
| **MIN()** | Menampilkan nilai terkecil dalam kolom |
| **MAX()** | Menampilkan nilai terbesar dalam kolom |

Mari kita bahas masing-masing dengan contoh! 🎯

---

## **2️⃣ SUM() – Menjumlahkan Nilai**
SUM digunakan untuk menjumlahkan angka dalam suatu kolom.

### **➤ Contoh: Total Nilai Semua Siswa**
```sql
SELECT SUM(nilai) AS total_nilai FROM nilai;
```
📌 **Penjelasan:** Menjumlahkan semua nilai siswa.

### **➤ Contoh: Total Penjualan Produk**
```sql
SELECT SUM(harga * jumlah_terjual) AS total_pendapatan FROM penjualan;
```
📌 **Menjumlahkan total pendapatan dari tabel penjualan.**

---

## **3️⃣ AVG() – Menghitung Rata-Rata**
AVG digunakan untuk menghitung **nilai rata-rata** dari suatu kolom.

### **➤ Contoh: Rata-rata Nilai Siswa**
```sql
SELECT AVG(nilai) AS rata_nilai FROM nilai;
```
📌 **Menghitung rata-rata semua nilai siswa.**

### **➤ Contoh: Rata-rata Harga Produk**
```sql
SELECT AVG(harga) AS rata_harga FROM produk;
```
📌 **Menghitung rata-rata harga produk dalam tabel produk.**

---

## **4️⃣ COUNT() – Menghitung Jumlah Data**
COUNT digunakan untuk menghitung **jumlah baris dalam tabel** yang sesuai dengan kondisi tertentu.

### **➤ Contoh: Hitung Jumlah Siswa**
```sql
SELECT COUNT(*) AS jumlah_siswa FROM siswa;
```
📌 **Menghitung total siswa dalam tabel siswa.**

### **➤ Contoh: Hitung Siswa di Kelas 12 RPL**
```sql
SELECT COUNT(*) AS jumlah_siswa_12 FROM siswa WHERE kelas = '12 RPL';
```
📌 **Hanya menghitung siswa yang ada di kelas 12 RPL.**

---

## **5️⃣ MIN() dan MAX() – Mencari Nilai Terkecil/Terbesar**

MIN digunakan untuk mencari **nilai terkecil**, sedangkan MAX mencari **nilai terbesar**.

### **➤ Contoh: Nilai Tertinggi dan Terendah dalam Ujian**
```sql
SELECT MIN(nilai) AS nilai_terendah, MAX(nilai) AS nilai_tertinggi FROM nilai;
```
📌 **Menampilkan nilai tertinggi dan terendah dari tabel nilai.**

### **➤ Contoh: Harga Produk Termurah dan Termahal**
```sql
SELECT MIN(harga) AS harga_termurah, MAX(harga) AS harga_termahal FROM produk;
```
📌 **Menampilkan produk dengan harga terendah dan tertinggi.**

---

## **6️⃣ GROUP BY – Mengelompokkan Data**
GROUP BY digunakan untuk **mengelompokkan data berdasarkan kolom tertentu**, biasanya digunakan bersama fungsi agregat.

### **➤ Contoh: Rata-rata Nilai Per Mata Pelajaran**
```sql
SELECT mata_pelajaran, AVG(nilai) AS rata_nilai
FROM nilai
GROUP BY mata_pelajaran;
```
📌 **Menghitung rata-rata nilai untuk setiap mata pelajaran.**

| mata_pelajaran | rata_nilai |
|---------------|------------|
| Matematika    | 80.5       |
| Bahasa Inggris | 85.2       |

### **➤ Contoh: Total Penjualan per Produk**
```sql
SELECT nama_produk, SUM(jumlah_terjual) AS total_terjual
FROM penjualan
GROUP BY nama_produk;
```
📌 **Mengelompokkan total penjualan berdasarkan nama produk.**

| nama_produk | total_terjual |
|------------|--------------|
| Laptop     | 50           |
| Mouse      | 100          |

---

## **7️⃣ HAVING – Menyaring Data Setelah GROUP BY**
HAVING digunakan untuk menyaring data **setelah GROUP BY**, karena WHERE tidak bisa digunakan pada agregasi.

### **➤ Contoh: Hanya Tampilkan Mata Pelajaran dengan Rata-rata Nilai > 80**
```sql
SELECT mata_pelajaran, AVG(nilai) AS rata_nilai
FROM nilai
GROUP BY mata_pelajaran
HAVING AVG(nilai) > 80;
```
📌 **Menampilkan mata pelajaran dengan rata-rata nilai di atas 80.**

### **➤ Contoh: Produk dengan Total Penjualan > 50**
```sql
SELECT nama_produk, SUM(jumlah_terjual) AS total_terjual
FROM penjualan
GROUP BY nama_produk
HAVING SUM(jumlah_terjual) > 50;
```
📌 **Menampilkan hanya produk yang total terjualnya lebih dari 50.**

---

## **Kesimpulan**

🔥 **SUM()** → Menjumlahkan nilai dalam kolom.
🔥 **AVG()** → Menghitung rata-rata nilai.
🔥 **COUNT()** → Menghitung jumlah data.
🔥 **MIN() / MAX()** → Mencari nilai terkecil / terbesar.
🔥 **GROUP BY** → Mengelompokkan data berdasarkan kolom tertentu.
🔥 **HAVING** → Menyaring hasil setelah GROUP BY.

📌 **Singkatnya:**
- **SUM** = Total pendapatan toko 🏪
- **AVG** = Rata-rata nilai ujian 🎓
- **COUNT** = Berapa banyak siswa dalam kelas 👨‍🎓
- **MIN/MAX** = Harga termurah/termahal di e-commerce 🛒
- **GROUP BY** = Laporan total penjualan per kategori 📊
- **HAVING** = Filter hanya yang di atas target 🎯

Semoga materi ini mudah dipahami! Kalau ada pertanyaan, tanya saja! 😊🚀


---
### **Navigasi**
Prev ⏮ [Materi 6: Pencarian dan Penyaringan Data dengan Query SQL](../6/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 8: Pembuatan Stored Procedure, Function, dan Trigger](../8/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606