# **Input Data (INSERT)**  

## **1️⃣ Apa Itu Input Data dalam SQL?**  
Input data dalam SQL dilakukan menggunakan perintah **INSERT**, yang merupakan bagian dari **DML (Data Manipulation Language)**. Perintah ini digunakan untuk **menambahkan data baru ke dalam tabel** yang sudah dibuat sebelumnya.  

---

## **2️⃣ Format Dasar Perintah INSERT**  
### **A. INSERT INTO (Menentukan Semua Kolom Secara Berurutan)**
Jika ingin memasukkan data ke dalam semua kolom dalam tabel, gunakan format berikut:  
```sql
INSERT INTO nama_tabel VALUES (nilai1, nilai2, nilai3, ...);
```
Namun, cara ini **kurang disarankan** karena tidak fleksibel saat struktur tabel berubah.  

### **B. INSERT INTO dengan Kolom Tertentu (Direkomendasikan)**
```sql
INSERT INTO nama_tabel (kolom1, kolom2, kolom3, ...) 
VALUES (nilai1, nilai2, nilai3, ...);
```
Keuntungan metode ini:  
✅ Lebih fleksibel karena hanya memasukkan data ke kolom yang dipilih.  
✅ Tidak terpengaruh jika struktur tabel berubah.  

---

## **3️⃣ Contoh Praktik Input Data dalam Uji Kompetensi Kejuruan (UKK)**  

Dalam **soal UKK yang Anda berikan**, peserta diminta untuk mengelola **basis data toko**, termasuk entitas **Pelanggan, Produk, Penjualan, dan Detail Penjualan**.  

---

### **A. Memasukkan Data ke dalam Tabel Pelanggan**
Tabel **Pelanggan** menyimpan informasi pelanggan, seperti **nama, alamat, nomor telepon, dan email**.  
```sql
INSERT INTO Pelanggan (nama, alamat, no_telp, email) 
VALUES 
('Budi Santoso', 'Jakarta', '08123456789', 'budi@email.com'),
('Siti Aisyah', 'Bandung', '08223344556', 'siti@email.com'),
('Rizky Ramadhan', 'Surabaya', '08334455667', 'rizky@email.com');
```
🔹 **Penjelasan:**  
- Memasukkan **3 data pelanggan sekaligus** menggunakan **batch INSERT** untuk efisiensi.  
- Setiap pelanggan memiliki **ID yang bersifat auto-increment**, sehingga tidak perlu dimasukkan manual.  

---

### **B. Memasukkan Data ke dalam Tabel Produk**
Tabel **Produk** menyimpan informasi tentang barang yang dijual.  
```sql
INSERT INTO Produk (nama_produk, kategori, harga, stok) 
VALUES 
('Laptop ASUS', 'Elektronik', 7500000, 10),
('Mouse Logitech', 'Aksesoris', 250000, 50),
('Keyboard Mechanical', 'Aksesoris', 500000, 30);
```
🔹 **Penjelasan:**  
- Data produk mencakup **nama produk, kategori, harga, dan stok**.  
- Memasukkan **stok awal** untuk memastikan barang tersedia.  

---

### **C. Memasukkan Data ke dalam Tabel Penjualan**
Tabel **Penjualan** mencatat transaksi, termasuk **tanggal transaksi, ID pelanggan, total harga, dan metode pembayaran**.  
```sql
INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES 
('2024-03-04', 1, 7500000, 'Transfer Bank'),
('2024-03-05', 2, 500000, 'Tunai');
```
🔹 **Penjelasan:**  
- **ID pelanggan** digunakan sebagai **Foreign Key** untuk menghubungkan transaksi dengan pelanggan.  
- **Metode pembayaran** bisa berupa "Transfer Bank", "Tunai", atau "Kartu Kredit".  

---

### **D. Memasukkan Data ke dalam Tabel Detail Penjualan**
Tabel **Detail Penjualan** mencatat **produk apa saja yang dibeli dalam setiap transaksi**.  
```sql
INSERT INTO Detail_Penjualan (id_penjualan, id_produk, jumlah, harga_total) 
VALUES 
(1, 1, 1, 7500000), -- Transaksi pertama: Laptop ASUS, 1 unit
(2, 3, 1, 500000);  -- Transaksi kedua: Keyboard Mechanical, 1 unit
```
🔹 **Penjelasan:**  
- **id_penjualan** dan **id_produk** digunakan untuk menghubungkan tabel.  
- **Jumlah barang** dan **harga total** dihitung berdasarkan harga produk.  

---

## **4️⃣ Input Data Menggunakan Data dari Tabel Lain (INSERT INTO SELECT)**
Kadang, kita ingin memasukkan data dari satu tabel ke tabel lain tanpa mengetik ulang.  

🔹 **Contoh:** Jika ada **pelanggan baru yang melakukan transaksi pertama kali**, kita bisa memasukkan mereka langsung ke tabel **Penjualan** dari tabel **Pelanggan**.  
```sql
INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran)
SELECT '2024-03-06', id_pelanggan, 1000000, 'Kartu Kredit' FROM Pelanggan WHERE nama = 'Siti Aisyah';
```
🔹 **Penjelasan:**  
- Mengambil **id_pelanggan dari tabel Pelanggan** secara otomatis.  
- Digunakan ketika pelanggan baru melakukan transaksi.  

---

## **5️⃣ Kesalahan Umum dalam Input Data (INSERT)**
❌ **Tidak mencantumkan nama kolom dalam INSERT INTO**  
```sql
INSERT INTO Pelanggan VALUES ('Budi', 'Jakarta', '08123456789', 'budi@email.com');
```
🔹 **Masalah:** Jika struktur tabel berubah, query ini bisa error.  

✅ **Solusi:** Gunakan nama kolom secara eksplisit.  

---

❌ **Memasukkan nilai yang tidak sesuai tipe data**  
```sql
INSERT INTO Produk (nama_produk, kategori, harga, stok) 
VALUES ('Laptop ASUS', 'Elektronik', 'Tujuh Juta', 'Sepuluh');
```
🔹 **Masalah:** **Harga** dan **stok** harus berupa angka, bukan teks.  

✅ **Solusi:**  
```sql
INSERT INTO Produk (nama_produk, kategori, harga, stok) 
VALUES ('Laptop ASUS', 'Elektronik', 7500000, 10);
```

---

❌ **Lupa mencantumkan Foreign Key yang valid**  
```sql
INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES ('2024-03-04', 99, 7500000, 'Transfer Bank');
```
🔹 **Masalah:** **id_pelanggan = 99 tidak ada di tabel Pelanggan**, sehingga akan error.  

✅ **Solusi:** Pastikan **id_pelanggan sudah ada sebelum memasukkan data**.  

---

## **6️⃣ Kesimpulan**
✅ **Perintah INSERT digunakan untuk menambahkan data ke dalam tabel**.  
✅ **Gunakan INSERT INTO dengan nama kolom untuk fleksibilitas**.  
✅ **Pastikan data yang dimasukkan sesuai dengan tipe data tabel**.  
✅ **Gunakan INSERT INTO SELECT jika ingin memasukkan data dari tabel lain**.  

---

Lihat [Materi Transaksi](./Transaksi/README.MD)