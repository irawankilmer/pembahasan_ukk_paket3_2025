# **Materi 13: Dokumentasi dan Pelaporan**

## **Pendahuluan**

Setelah kita membuat, mengelola, dan menguji basis data, langkah terakhir yang tidak kalah penting adalah **dokumentasi dan pelaporan**. Dokumentasi berguna untuk **merekam semua struktur, proses, dan perubahan yang terjadi di database**, sedangkan pelaporan bertujuan untuk **menyajikan data dalam bentuk yang mudah dibaca dan dipahami**.

📌 **Kenapa Dokumentasi dan Pelaporan Penting?**
✅ Memudahkan tim lain memahami sistem database.
✅ Membantu troubleshooting jika terjadi masalah.
✅ Mempermudah proses pengembangan lebih lanjut.
✅ Menyajikan data dengan jelas kepada pengguna atau atasan.

Mari kita bahas bagaimana cara melakukan dokumentasi dan pelaporan database secara sistematis! 🚀

---

## **1️⃣ Dokumentasi Basis Data**

Dokumentasi basis data mencakup **struktur tabel, relasi antar tabel, indeks, query yang sering digunakan, serta prosedur dan trigger yang dibuat**.

### **➤ Dokumentasi Struktur Tabel**
Untuk mendokumentasikan struktur tabel dalam database, kita bisa menggunakan perintah:
```sql
SHOW CREATE TABLE siswa;
```
📌 **Hasilnya akan menunjukkan skrip SQL yang digunakan untuk membuat tabel `siswa`.**

Jika ingin melihat semua tabel dalam database:
```sql
SHOW TABLES;
```
📌 **Dokumentasi ini bisa disimpan dalam file terpisah atau dalam sistem manajemen proyek.** ✅

### **➤ Dokumentasi Relasi Antar Tabel**
Untuk melihat bagaimana tabel-tabel dalam database saling berhubungan, kita bisa menggambarkan **Entity-Relationship Diagram (ERD)** menggunakan tools seperti:
✅ **MySQL Workbench** (Fitur Reverse Engineering ERD)
✅ **DB Diagram (Online Tool)**
✅ **Microsoft Visio**

Dokumentasi ini sangat membantu dalam memahami bagaimana data saling terhubung! 🔗

### **➤ Dokumentasi Indeks dalam Database**
Untuk melihat daftar indeks dalam tabel, gunakan:
```sql
SHOW INDEX FROM siswa;
```
📌 **Indeks yang dibuat harus dicatat dalam dokumentasi agar tim lain tahu mana yang digunakan untuk optimasi.**

### **➤ Dokumentasi Query yang Sering Digunakan**
Jika ada query yang sering dipakai untuk pelaporan, sebaiknya didokumentasikan. Contoh:
```sql
SELECT nama, kelas FROM siswa WHERE kelas = '12 RPL';
```
📌 **Dokumentasikan query seperti ini agar bisa digunakan kembali tanpa harus menulis ulang.**

### **➤ Dokumentasi Stored Procedure, Function, dan Trigger**
Untuk melihat daftar **Stored Procedure**:
```sql
SHOW PROCEDURE STATUS WHERE Db = 'sekolah';
```
Untuk melihat daftar **Trigger**:
```sql
SHOW TRIGGERS FROM sekolah;
```
📌 **Semua prosedur dan trigger harus dicatat agar pengembang lain tahu bagaimana sistem bekerja.** ✅

---

## **2️⃣ Pelaporan Basis Data**

Pelaporan dalam basis data bertujuan untuk **menampilkan data dalam format yang mudah dibaca** oleh pengguna atau atasan. Biasanya, laporan dibuat dalam bentuk **tabel, grafik, atau file yang bisa diunduh**.

### **➤ Membuat Laporan Sederhana dalam SQL**
Misalnya kita ingin membuat laporan jumlah siswa per kelas:
```sql
SELECT kelas, COUNT(*) AS jumlah_siswa
FROM siswa
GROUP BY kelas;
```
📌 **Hasilnya akan menunjukkan jumlah siswa di setiap kelas.** ✅

### **➤ Membuat Laporan dengan Format Tertentu**
Jika ingin mengurutkan berdasarkan jumlah siswa terbanyak:
```sql
SELECT kelas, COUNT(*) AS jumlah_siswa
FROM siswa
GROUP BY kelas
ORDER BY jumlah_siswa DESC;
```
📌 **Menampilkan kelas dengan jumlah siswa terbanyak di urutan pertama.**

### **➤ Export Laporan ke File CSV**
Agar laporan bisa dibuka di Excel, kita bisa menyimpannya dalam format CSV:
```sql
SELECT * FROM siswa
INTO OUTFILE 'C:/backup/laporan_siswa.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```
📌 **Sekarang laporan tersimpan di `C:/backup/laporan_siswa.csv` dan bisa dibuka di Excel!** 📊

### **➤ Menggunakan View untuk Laporan yang Sering Digunakan**
Daripada menjalankan query berulang-ulang, kita bisa membuat **View**:
```sql
CREATE VIEW laporan_siswa AS
SELECT kelas, COUNT(*) AS jumlah_siswa
FROM siswa
GROUP BY kelas;
```
Sekarang, cukup panggil **View** ini kapan saja tanpa harus menulis ulang query:
```sql
SELECT * FROM laporan_siswa;
```
📌 **View membantu menyimpan laporan sebagai "query siap pakai".** ✅

### **➤ Membuat Laporan dengan JOIN**
Misalnya kita ingin menampilkan daftar siswa beserta nilai mereka:
```sql
SELECT siswa.nama, siswa.kelas, nilai.mata_pelajaran, nilai.nilai
FROM siswa
JOIN nilai ON siswa.id_siswa = nilai.id_siswa;
```
📌 **Menghubungkan tabel `siswa` dan `nilai` agar laporan lebih lengkap.** 🔗

---

## **3️⃣ Tips Dokumentasi dan Pelaporan yang Baik**

✅ **Buat dokumentasi sejelas mungkin agar mudah dipahami oleh tim lain.**
✅ **Gunakan ERD untuk memvisualisasikan relasi antar tabel.**
✅ **Simpan laporan dalam format CSV agar mudah diproses lebih lanjut.**
✅ **Gunakan View untuk mempercepat pembuatan laporan yang sering digunakan.**
✅ **Selalu uji laporan untuk memastikan data yang ditampilkan benar.**

---

## **Kesimpulan**

🔥 **Dokumentasi database membantu pengembang memahami struktur dan proses database.**
🔥 **Pelaporan basis data menyajikan informasi dalam format yang mudah dibaca.**
🔥 **Gunakan View dan Export CSV untuk mempermudah akses data.**
🔥 **Pastikan laporan selalu diuji dan validasi sebelum disajikan.**

📌 **Singkatnya:**
- **Dokumentasi** = Menyimpan semua informasi database 📑
- **Pelaporan** = Menampilkan data dengan format yang mudah dibaca 📊
- **View & CSV** = Mempermudah akses laporan 🚀

Semoga materi ini mudah dipahami! Kalau ada pertanyaan, tanya saja! 😊🚀

---
### **Navigasi**
Prev ⏮ [Materi 12: Pengujian dan Validasi Basis Data](../12/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606