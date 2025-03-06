# **SILABUS UJI KOMPETENSI KEAHLIAN (UKK) RPL**

## **Topik: Pengelolaan Basis Data**

**Kompetensi Keahlian:** Rekayasa Perangkat Lunak\
**Alokasi Waktu:** 8 Jam

---

## **A. TUJUAN PEMBELAJARAN**

Setelah mengikuti pembelajaran ini, siswa diharapkan mampu:

1. **Mengidentifikasi kebutuhan sistem basis data** untuk pengelolaan transaksi, pelanggan, dan stok produk.
2. **Membuat skema database** menggunakan **Entity Relationship Diagram (ERD)** dan menentukan hubungan antar entitas.
3. **Mengimplementasikan database** dengan **SQL (Structured Query Language)**.
4. **Menginput, mengubah, dan menghapus data** dalam tabel database menggunakan **INSERT, UPDATE, DELETE**.
5. **Menggunakan query SQL** untuk pencarian dan analisis data dengan **WHERE, IN, BETWEEN, LIKE, GROUP BY, HAVING**.
6. **Mengoptimalkan database** dengan indeksasi, normalisasi, dan teknik optimasi lainnya.
7. **Menerapkan backup dan restore database** untuk menjaga integritas data.
8. **Melakukan pengujian terhadap database** untuk memastikan sistem bekerja dengan baik.
9. **Membuat dokumentasi basis data** yang mencakup perancangan, implementasi, serta pemeliharaan sistem.

---

## **B. RINCIAN MATERI & DURASI WAKTU**

| **No** | **Materi**                                            | **Sub-Materi**                                                                                                                                                                                 | **Durasi** |
| ------ | ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| **1**  | [**Analisis Kebutuhan Basis Data**](./1/README.MD)                     | - Identifikasi data transaksi, pelanggan, dan stok produk- Penentuan jenis data dan formatnya- Analisis kebutuhan user                                                                         | 45 menit   |
| **2**  | **Perancangan Skema Basis Data**                      | - Pembuatan Entity Relationship Diagram (ERD)- Menentukan entitas, atribut, dan relasi- Menentukan Primary Key (PK) dan Foreign Key (FK)                                                       | 60 menit   |
| **3**  | [**Pembuatan dan Implementasi Basis Data**](./3/README.MD)             | - Pengenalan SQL dan struktur tabel- Perintah **CREATE TABLE, ALTER TABLE**- Menentukan tipe data yang tepat                                                                                   | 60 menit   |
| **4**  | **Pengisian dan Pengelolaan Data**                    | - Perintah **INSERT INTO** untuk memasukkan data- Perintah **UPDATE** untuk mengubah data- Perintah **DELETE** untuk menghapus data                                                            | 45 menit   |
| **5**  | **Definisi Relasi Antar Tabel**                       | - Penerapan Foreign Key untuk relasi antar tabel- Perintah **JOIN** untuk menghubungkan data dari beberapa tabel                                                                               | 45 menit   |
| **6**  | **Pencarian dan Penyaringan Data dengan Query SQL**   | - Perintah dasar: **SELECT, WHERE, ORDER BY**- Operator logika: **AND, OR, NOT**- Penggunaan **IN, BETWEEN, LIKE** untuk filter data                                                           | 60 menit   |
| **7**  | **Fungsi Agregat dan Grouping Data**                  | - Fungsi agregat: **SUM, AVG, COUNT, MIN, MAX**- Perintah **GROUP BY & HAVING** untuk mengelompokkan data                                                                                      | 45 menit   |
| **8**  | **Pembuatan Stored Procedure, Function, dan Trigger** | - Perintah **CREATE PROCEDURE** untuk membuat prosedur otomatis- Pembuatan **FUNCTION** untuk operasi yang sering digunakan- Pembuatan **TRIGGER** untuk eksekusi otomatis pada perubahan data | 60 menit   |
| **9**  | **Operasi Relasional & Transaksi Database**           | - Perintah **COMMIT, ROLLBACK** untuk pengelolaan transaksi- Studi kasus transaksi penjualan dan stok barang                                                                                   | 45 menit   |
| **10** | **Optimasi Basis Data**                               | - Indeksasi pada kolom pencarian utama (**CREATE INDEX**)- Teknik Normalisasi Database (1NF, 2NF, 3NF)                                                                                         | 45 menit   |
| **11** | **Penerapan Backup dan Restore Database**             | - Perintah **BACKUP DATABASE** untuk pencadangan data- Teknik restore dengan **RESTORE DATABASE**                                                                                              | 30 menit   |
| **12** | **Pengujian dan Validasi Basis Data**                 | - Uji coba query dengan berbagai skenario- Debugging error pada database                                                                                                                       | 45 menit   |
| **13** | **Dokumentasi dan Pelaporan**                         | - Pembuatan dokumentasi desain database (ERD, skema SQL)- Laporan penggunaan sistem database                                                                                                   | 30 menit   |

---

## **C. METODE PEMBELAJARAN**

1. **Teori dan Diskusi**
   - Penjelasan konsep database, SQL, dan sistem manajemen basis data.
   - Analisis kebutuhan database berdasarkan studi kasus yang diberikan.
2. **Praktik Mandiri**
   - Implementasi database sesuai skenario pada soal UKK.
   - Pengujian dan debugging query SQL.
3. **Simulasi dan Evaluasi**
   - Simulasi pengelolaan transaksi basis data seperti pada soal.
   - Evaluasi hasil pekerjaan menggunakan kriteria penilaian UKK.

---

## **D. KRITERIA PENILAIAN (BERDASARKAN DOKUMEN PENILAIAN UKK)**

| **Kompetensi**                             | **Indikator Keberhasilan**                                                                                                                                      | **Bobot (%)** |
| ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- |
| **Menggunakan Tools Basis Data**           | - Memilih dan mengoperasikan perangkat lunak basis data dengan benar                                                                                            | 10%           |
| **Merancang dan Membuat Basis Data**       | - Membuat ERD sesuai kebutuhan sistem- Menentukan PK dan FK dengan tepat                                                                                        | 15%           |
| **Mengimplementasikan Basis Data**         | - Membuat tabel dengan struktur yang benar- Menjalankan perintah SQL dasar                                                                                      | 15%           |
| **Mengolah dan Mengelola Data**            | - Memasukkan, mengubah, dan menghapus data dengan benar (**INSERT, UPDATE, DELETE**)- Menggunakan query SQL untuk pencarian data (**WHERE, IN, BETWEEN, LIKE**) | 15%           |
| **Optimasi dan Keamanan Basis Data**       | - Menerapkan indeksasi dan normalisasi- Melakukan backup dan restore database                                                                                   | 15%           |
| **Mengembangkan Fitur Lanjutan**           | - Membuat stored procedure, function, dan trigger- Menggunakan commit dan rollback                                                                              | 15%           |
| **Menguji dan Mendokumentasikan Database** | - Menguji database dengan query- Menyusun dokumentasi sistem                                                                                                    | 15%           |

✅ **Total: 100%** (Untuk mendapatkan nilai "Sangat Kompeten", semua aspek harus terpenuhi dengan baik.)

---

## **E. PENUTUP**

Silabus ini dibuat sebagai panduan untuk menyelesaikan **Uji Kompetensi Keahlian (UKK) Rekayasa Perangkat Lunak** dengan hasil terbaik. Dengan memahami materi ini secara mendalam dan berlatih, diharapkan dapat mencapai **nilai maksimal (91-100) dan mendapatkan predikat "Sangat Kompeten"**.

Selamat Menjalankan Uji Kompetensi Keahlian 

---

#### TTD


#### Irawan