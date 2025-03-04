# **Pencatatan Transaksi**  

Setelah memahami cara **Input Data (INSERT)**, langkah selanjutnya dalam **Uji Kompetensi Kejuruan (UKK) Pengelolaan Basis Data** adalah **pencatatan transaksi**.  

Pencatatan transaksi dalam database mencakup **penyimpanan data transaksi penjualan**, hubungan dengan pelanggan, serta pencatatan detail barang yang dibeli dalam transaksi tersebut.  

---

## **1️⃣ Apa Itu Pencatatan Transaksi dalam Basis Data?**  
Pencatatan transaksi adalah proses menyimpan data **setiap transaksi penjualan** yang terjadi di perusahaan. Data ini harus:  
✅ **Tersimpan dengan benar dalam tabel Penjualan dan Detail Penjualan**  
✅ **Terhubung dengan data pelanggan dan produk melalui Foreign Key**  
✅ **Mencatat jumlah barang yang dibeli dan mengurangi stok produk**  
✅ **Dapat dikembalikan jika terjadi kesalahan dengan fitur ROLLBACK**  

---

## **2️⃣ Struktur Data yang Terlibat dalam Transaksi**  

| **Tabel** | **Fungsi** |
|-----------|------------|
| **Pelanggan** | Menyimpan data pelanggan yang melakukan transaksi |
| **Produk** | Menyimpan daftar produk yang dijual |
| **Penjualan** | Menyimpan data transaksi penjualan (tanggal, pelanggan, total harga, metode pembayaran) |
| **Detail Penjualan** | Menyimpan produk yang dibeli dalam setiap transaksi (jumlah barang, harga total) |

🔹 **Relasi Antar Tabel:**  
- **Setiap transaksi penjualan** terkait dengan **satu pelanggan** (1 pelanggan bisa melakukan banyak transaksi).  
- **Setiap transaksi penjualan** bisa memiliki **banyak produk** (menggunakan tabel **Detail Penjualan**).  
- **Setiap produk** bisa dijual dalam **banyak transaksi**.  

---

## **3️⃣ Proses Pencatatan Transaksi dalam SQL**  

Untuk mencatat transaksi, kita harus:  
1️⃣ **Mencatat data transaksi ke tabel Penjualan**  
2️⃣ **Mencatat produk yang dibeli ke tabel Detail Penjualan**  
3️⃣ **Mengurangi stok produk di tabel Produk**  
4️⃣ **Menggunakan transaksi SQL (COMMIT & ROLLBACK) untuk keamanan data**  

---

### **A. Mencatat Transaksi ke dalam Tabel Penjualan**  
Tabel **Penjualan** menyimpan informasi transaksi yang dilakukan pelanggan.  

🔹 **Contoh Transaksi Baru**  
```sql
INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES ('2024-03-06', 1, 8000000, 'Transfer Bank');
```
🔹 **Penjelasan:**  
- **tanggal_transaksi** → Tanggal transaksi terjadi.  
- **id_pelanggan** → ID pelanggan yang melakukan transaksi (Foreign Key ke tabel Pelanggan).  
- **total_harga** → Total pembayaran dalam transaksi tersebut.  
- **metode_pembayaran** → Bisa berupa "Tunai", "Transfer Bank", atau "Kartu Kredit".  

---

### **B. Mencatat Produk yang Dibeli ke dalam Tabel Detail Penjualan**  
Tabel **Detail Penjualan** mencatat **barang apa saja yang dibeli dalam satu transaksi**.  

🔹 **Contoh Detail Transaksi:**  
```sql
INSERT INTO Detail_Penjualan (id_penjualan, id_produk, jumlah, harga_total) 
VALUES 
(1, 1, 1, 7500000), -- Laptop ASUS, 1 unit
(1, 2, 2, 500000);  -- Mouse Logitech, 2 unit
```
🔹 **Penjelasan:**  
- **id_penjualan** → ID transaksi yang sudah tercatat di tabel Penjualan.  
- **id_produk** → ID produk yang dibeli (Foreign Key ke tabel Produk).  
- **jumlah** → Jumlah barang yang dibeli dalam transaksi tersebut.  
- **harga_total** → Total harga dari produk tersebut (harga satuan × jumlah).  

---

### **C. Mengurangi Stok Produk Setelah Transaksi**  
Setelah pelanggan membeli barang, stok produk harus berkurang.  

🔹 **Contoh: Mengurangi Stok Laptop ASUS dan Mouse Logitech**  
```sql
UPDATE Produk 
SET stok = stok - 1 
WHERE id_produk = 1; -- Laptop ASUS berkurang 1 unit

UPDATE Produk 
SET stok = stok - 2 
WHERE id_produk = 2; -- Mouse Logitech berkurang 2 unit
```
🔹 **Penjelasan:**  
- **stok = stok - jumlah** → Mengurangi stok produk sesuai jumlah yang dibeli.  
- **WHERE id_produk = ...** → Hanya mengupdate stok produk yang dibeli.  

---

### **D. Menggunakan Transaksi SQL (COMMIT & ROLLBACK) untuk Keamanan Data**  
SQL mendukung fitur **transaksi (Transaction Control)** agar pencatatan transaksi lebih aman.  

🔹 **Gunakan BEGIN TRANSACTION untuk Memulai Transaksi**  
```sql
START TRANSACTION;

INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES ('2024-03-06', 1, 8000000, 'Transfer Bank');

INSERT INTO Detail_Penjualan (id_penjualan, id_produk, jumlah, harga_total) 
VALUES 
(1, 1, 1, 7500000),
(1, 2, 2, 500000);

UPDATE Produk 
SET stok = stok - 1 WHERE id_produk = 1;

UPDATE Produk 
SET stok = stok - 2 WHERE id_produk = 2;

COMMIT; -- Konfirmasi transaksi
```
🔹 **Penjelasan:**  
- **START TRANSACTION** → Memulai transaksi.  
- **Jika semua perintah berhasil**, **COMMIT** akan menyimpan perubahan.  
- **Jika ada kesalahan**, kita bisa membatalkan transaksi dengan **ROLLBACK**.  

🔹 **Jika Terjadi Kesalahan, Batalkan Transaksi dengan ROLLBACK**  
```sql
START TRANSACTION;

INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES ('2024-03-06', 99, 8000000, 'Transfer Bank'); -- ERROR karena id_pelanggan 99 tidak ada!

ROLLBACK; -- Batalkan semua perubahan jika ada error
```
🔹 **Penjelasan:**  
- Jika **id_pelanggan tidak valid**, maka **semua transaksi dibatalkan** agar tidak ada data yang kacau.  
- **Data tetap aman dan tidak ada transaksi setengah jalan.**  

---

## **4️⃣ Kesalahan Umum dalam Pencatatan Transaksi**  

❌ **Tidak menghubungkan transaksi dengan pelanggan yang valid**  
```sql
INSERT INTO Penjualan (tanggal_transaksi, id_pelanggan, total_harga, metode_pembayaran) 
VALUES ('2024-03-06', 99, 8000000, 'Transfer Bank');
```
🔹 **Masalah:** **id_pelanggan 99 tidak ada, sehingga transaksi gagal.**  

✅ **Solusi:** Pastikan **id_pelanggan sudah ada di tabel Pelanggan**.  

---

❌ **Tidak mengurangi stok produk setelah transaksi**  
🔹 **Masalah:** Jika stok tidak dikurangi, bisa terjadi **penjualan produk melebihi stok yang tersedia**.  

✅ **Solusi:** Gunakan **UPDATE Produk SET stok = stok - jumlah** untuk mengurangi stok setiap kali transaksi terjadi.  

---

## **5️⃣ Kesimpulan**  
✅ **Pencatatan transaksi harus dilakukan dengan benar agar data tetap akurat**.  
✅ **Detail transaksi harus terhubung dengan pelanggan, produk, dan stok harus diperbarui**.  
✅ **Gunakan COMMIT dan ROLLBACK untuk memastikan transaksi berjalan aman**.  
✅ **Hindari kesalahan umum seperti tidak mengurangi stok atau memasukkan ID yang tidak valid**.  

---