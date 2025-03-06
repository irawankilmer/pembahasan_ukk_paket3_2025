# **Materi 1: Analisis Kebutuhan Basis Data**

## **Pendahuluan**

Bayangkan Kalian adalah seorang **arsitek** yang ingin membangun sebuah rumah. Sebelum mulai membangun, tentu Kalian harus tahu **apa saja yang dibutuhkan** dalam rumah tersebut: berapa kamar tidur? Ada garasi atau tidak? Apakah perlu taman? Nah, dalam dunia **basis data**, proses ini disebut **Analisis Kebutuhan Basis Data**.

Analisis ini penting karena kalau kita salah menentukan kebutuhan, nanti sistemnya bisa jadi kurang efisien atau malah sulit digunakan. Ibarat rumah yang tidak dirancang dengan baik, jadinya malah sempit, berantakan, dan bikin pusing! 😅

---

## **Kenapa Analisis Kebutuhan Itu Penting?**

Kita perlu melakukan analisis kebutuhan agar:<br>
✅ Data yang kita simpan sesuai dengan yang dibutuhkan.<br>
✅ Database tidak terlalu besar atau terlalu kecil.<br>
✅ Informasi bisa diakses dengan mudah dan cepat.<br>
✅ Sistem bisa berjalan **efisien** dan **tidak membuang sumber daya**.

Misalnya, kita sedang membuat sistem database untuk **sekolah**. Kita harus tahu dulu **data apa saja yang akan disimpan**. Apakah hanya nama siswa? Atau juga nilai, alamat, dan orang tua mereka? Kalau kita tidak menentukan sejak awal, nanti bisa berantakan di tengah jalan. 😵

---

## **Langkah-langkah Analisis Kebutuhan Basis Data**

### **1. Identifikasi Tujuan Basis Data**
Sebelum mulai mendesain, kita harus tahu **kenapa database ini dibuat**. Contoh, kita mau membuat database siswa di sekolah untuk **mencatat data siswa, absen, dan nilai**. Artinya, kita butuh menyimpan informasi seperti:
- **Data siswa** (nama, jenis kelamin, kelas, NISN, alamat, dll.)
- **Data nilai** (mata pelajaran, nilai harian, nilai ujian, rata-rata, dll.)
- **Data absensi** (tanggal masuk, izin, sakit, alfa, dll.)

Jadi, tujuan dari database ini adalah **mempermudah sekolah dalam mengelola data siswa**.

### **2. Identifikasi Entitas dan Atribut**
Nah, setelah tahu tujuannya, sekarang kita harus menentukan **entitas** (sesuatu yang ingin kita simpan datanya) dan **atribut** (informasi detail dari entitas tersebut).

Mari kita lihat contoh **entitas dan atributnya**:

| **Entitas (Tabel Database)** | **Atribut (Kolom di Tabel)** |
|-----------------|----------------------------------------|
| **Siswa**       | ID, Nama, Jenis Kelamin, Kelas, NISN |
| **Mata Pelajaran** | ID, Nama Mata Pelajaran, Guru Pengampu |
| **Nilai**       | ID, ID Siswa, ID Mata Pelajaran, Nilai Harian, Nilai Ujian |
| **Absensi**     | ID, ID Siswa, Tanggal, Status (Hadir/Sakit/Izin/Alfa) |

Contoh:
- **Nama:** Ach Fajar Rinjani
- **Jenis Kelamin:** Laki-laki (L)
- **Kelas:** 12 RPL
- **NISN:** 1234567890

Jadi, kita bisa menyimpan data ini ke dalam tabel **Siswa**. 😃

### **3. Menentukan Hubungan Antar Entitas**
Setelah kita punya tabel-tabel, kita harus menentukan **hubungan antar tabel**. Misalnya:
- **Siswa bisa memiliki banyak nilai** → Relasi **1 ke Banyak (One to Many)**
- **Siswa bisa memiliki banyak absensi** → Relasi **1 ke Banyak**
- **Mata pelajaran bisa diajarkan oleh satu guru** → Relasi **1 ke 1**

Gampangnya, kalau kita ibaratkan seperti hubungan dalam keluarga:
- **Siswa** = Anak
- **Mata Pelajaran** = Mata kuliah yang mereka ambil
- **Nilai** = Hasil ujian mereka
- **Absensi** = Kehadiran mereka di kelas

Dengan memahami hubungan ini, kita bisa membuat database yang **tidak tumpang tindih dan lebih terstruktur**. 😎
#### Note: Untuk materi ini dibahas di kelas 11, silahkan buka lagi catatannya.

### **4. Validasi Kebutuhan dan Penyusunan Dokumen**
Setelah semua analisis selesai, kita harus memastikan:<br>
✅ Semua data yang dibutuhkan sudah teridentifikasi.<br>
✅ Tidak ada data yang berulang atau tidak perlu.<br>
✅ Struktur database sudah logis dan efisien.

---

## **Kesimpulan**
Analisis kebutuhan basis data itu seperti **membuat blueprint sebelum membangun rumah**. Kalau kita tidak melakukannya dengan benar, nantinya bisa berantakan dan tidak sesuai kebutuhan. Dengan mengikuti langkah-langkah di atas, kita bisa membuat database yang **efisien, rapi, dan mudah digunakan**. 🎯

Sekarang, coba pikirkan: Kalau Kalian diminta membuat database untuk sekolah Kalian sendiri, **data apa saja yang menurut Kalian penting untuk disimpan?** 😉

## Bade kamana? Lanjutkan membaca...
Dalam kasus **soal Uji Kompetensi Keahlian (UKK)** paket 3, **Analisis Kebutuhan Basis Data** dilakukan dengan memahami skenario yang diberikan dalam soal.<br>
Mari kita bahas secara rinci **apa saja yang harus dilakukan oleh kalian pada tahap ini**.  

---

### **1️⃣ Memahami Skenario Soal**  
Soal UKK meminta kalian menjadi seorang **Database Administrator** yang harus membuat sistem database untuk sebuah **perusahaan** dengan entitas berikut:  
- **Penjualan**  
- **Pelanggan**  
- **Produk**  
- **Detail Penjualan**  

Jadi, kalian harus **menganalisis kebutuhan data** dengan menjawab pertanyaan berikut:  
✅ **Data apa saja yang harus disimpan?**  
✅ **Hubungan antar data bagaimana?**  
✅ **Bagaimana cara menyimpan dan mengakses data tersebut?**  

---

### **2️⃣ Identifikasi Data yang Dibutuhkan**  
Kalian harus mencatat informasi apa saja yang perlu disimpan dalam database. Contohnya:  

| **Entitas (Tabel Database)** | **Atribut (Kolom dalam Tabel)** |
|-----------------|-----------------------------------------|
| **Pelanggan** | ID Pelanggan, Nama, Alamat, Nomor Telepon |
| **Produk** | ID Produk, Nama Produk, Harga, Stok |
| **Penjualan** | ID Penjualan, ID Pelanggan, Tanggal Transaksi, Total Harga |
| **Detail Penjualan** | ID, ID Penjualan, ID Produk, Jumlah Barang, Subtotal |

➡ **Contoh Data Pelanggan:**  
- **Nama Pelanggan:** Ach Fajar Rinjani  
- **Alamat:** Jl. Merdeka No. 10  
- **Nomor Telepon:** 0812-3456-7890  

Jika database ini untuk sekolah, pelanggan bisa diubah menjadi **siswa**, dan produk bisa diubah menjadi **buku atau perlengkapan sekolah**.

---

### **3️⃣ Menentukan Hubungan Antar Data**  
Setelah tahu data apa yang dibutuhkan, Kalian harus menentukan **hubungan antar tabel**. Contoh:  
✅ **Satu pelanggan bisa melakukan banyak transaksi** (**One to Many** antara Pelanggan dan Penjualan).  
✅ **Satu transaksi bisa melibatkan banyak produk** (**Many to Many** antara Penjualan dan Produk, melalui Detail Penjualan).  
✅ **Setiap produk bisa dijual dalam banyak transaksi** (**One to Many** antara Produk dan Detail Penjualan).  

Ibaratnya seperti ini:  
- **Pelanggan adalah seorang pembeli**.  
- **Penjualan adalah nota transaksi mereka**.  
- **Produk adalah barang yang mereka beli**.  
- **Detail Penjualan adalah rincian isi nota** (berapa banyak barang yang dibeli, harga, dll.).  

---

### **4️⃣ Mencatat dan Menyusun Dokumen Analisis Kebutuhan**  
Kalian **tidak hanya mengandalkan ingatan**, tetapi juga harus mencatat hasil analisisnya. Biasanya kalian diharuskan bisa membuat:  

📌 **Dokumen Identifikasi Kebutuhan** berisi daftar tabel dan atribut.  
📌 **Diagram Entity Relationship Diagram (ERD)** untuk menggambarkan hubungan antar tabel (dibahas di materi berikutnya).  

**➡ Apakah Kalian harus mencatat ini secara formal?**  
Ya! Sebaiknya Kalian mencatat dalam bentuk **tabel atau diagram**, karena ini akan sangat membantu dalam tahap pembuatan database nanti.  

---

### **Kesimpulan**  
Dalam soal UKK ini, **Analisis Kebutuhan Basis Data** berarti Kalian harus:  
✅ **Memahami skenario** soal dan menentukan apa yang dibutuhkan.  
✅ **Menentukan entitas dan atribut** yang akan dimasukkan ke dalam database.  
✅ **Menentukan hubungan antar tabel** agar database bisa bekerja dengan baik.  
✅ **Mencatat semua hasil analisisnya** agar lebih mudah dalam implementasi nanti.  

Setelah tahap ini selesai, Kalian akan lanjut ke **Perancangan Skema Basis Data (ERD)** di materi berikutnya. 🚀


---
### **Navigasi**
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 2: Perancangan Skema Basis Data](../2/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606