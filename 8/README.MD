# **Materi 8: Pembuatan Stored Procedure, Function, dan Trigger**

## **Pendahuluan**

Saat bekerja dengan database, kita sering melakukan operasi yang **berulang** seperti **memasukkan data, memperbarui stok, atau menghitung total nilai**. Jika setiap kali harus menulis ulang perintah SQL, itu akan **memakan waktu dan rawan kesalahan**.

Di sinilah **Stored Procedure, Function, dan Trigger** berperan! Mereka seperti **robot otomatis** dalam database yang bisa menjalankan tugas tertentu tanpa harus kita ulang-ulang secara manual. 🤖⚡

Mari kita bahas satu per satu! 🚀

---

## **1️⃣ Stored Procedure – Perintah SQL yang Bisa Digunakan Berulang Kali**

Stored Procedure adalah **blok kode SQL** yang bisa **disimpan** di dalam database dan **dipanggil kapan saja**. Ibaratnya seperti **resep masakan** yang bisa digunakan berkali-kali tanpa harus menulis ulang dari nol. 🍽️

### **➤ Cara Membuat Stored Procedure**
Misalkan kita ingin **menampilkan semua siswa dalam suatu kelas**:
```sql
DELIMITER $$
CREATE PROCEDURE GetSiswaByKelas(IN kelas_param VARCHAR(10))
BEGIN
    SELECT * FROM siswa WHERE kelas = kelas_param;
END $$
DELIMITER ;
```
📌 **Penjelasan:**
- `IN kelas_param VARCHAR(10)` → Parameter input untuk menentukan kelas.
- `SELECT * FROM siswa WHERE kelas = kelas_param;` → Query untuk menampilkan siswa berdasarkan kelas.

### **➤ Cara Memanggil Stored Procedure**
Sekarang, kita panggil stored procedure ini:
```sql
CALL GetSiswaByKelas('12 RPL');
```
📌 Hasilnya akan menampilkan semua siswa di **kelas 12 RPL**.

### **➤ Stored Procedure dengan INSERT**
Misalnya kita sering menambahkan siswa baru. Daripada menulis ulang query INSERT, kita buat prosedur:
```sql
DELIMITER $$
CREATE PROCEDURE TambahSiswa(IN nama_siswa VARCHAR(255), IN kelas_siswa VARCHAR(10))
BEGIN
    INSERT INTO siswa (nama, kelas) VALUES (nama_siswa, kelas_siswa);
END $$
DELIMITER ;
```
Sekarang, cukup panggil ini untuk menambah siswa:
```sql
CALL TambahSiswa('Budi Santoso', '11 TKJ');
```
📌 Lebih cepat dan praktis! 🚀

---

## **2️⃣ Function – Mengembalikan Nilai dari Operasi SQL**

**Function** hampir sama seperti Stored Procedure, tetapi **mengembalikan satu nilai saja**. Ini berguna untuk **perhitungan atau pemrosesan data**.

### **➤ Cara Membuat Function**
Misalnya kita ingin **menghitung rata-rata nilai siswa**:
```sql
DELIMITER $$
CREATE FUNCTION RataRataNilai(kelas_param VARCHAR(10)) RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE rata DECIMAL(5,2);
    SELECT AVG(nilai) INTO rata FROM nilai WHERE kelas = kelas_param;
    RETURN rata;
END $$
DELIMITER ;
```
📌 **Penjelasan:**
- `RETURNS DECIMAL(5,2)` → Function akan mengembalikan angka dengan 5 digit, 2 di belakang koma.
- `SELECT AVG(nilai) INTO rata` → Menghitung rata-rata nilai siswa.

### **➤ Cara Memanggil Function**
Sekarang kita panggil function ini:
```sql
SELECT RataRataNilai('12 RPL') AS rata_nilai;
```
📌 Hasilnya akan menampilkan **rata-rata nilai siswa di kelas 12 RPL**.

### **➤ Function untuk Menghitung Diskon Harga**
Misalnya kita punya sistem e-commerce dan ingin menghitung harga setelah diskon:
```sql
DELIMITER $$
CREATE FUNCTION HitungDiskon(harga DECIMAL(10,2), persen_diskon INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN harga - (harga * persen_diskon / 100);
END $$
DELIMITER ;
```
Sekarang kita bisa menghitung harga setelah diskon:
```sql
SELECT HitungDiskon(100000, 10) AS harga_setelah_diskon;
```
📌 Hasilnya adalah **90000** (karena 10% dari 100000 adalah 10000).

---

## **3️⃣ Trigger – Eksekusi Otomatis Saat Ada Perubahan Data**

Trigger adalah **aksi otomatis** yang berjalan **ketika ada perubahan pada tabel** (INSERT, UPDATE, DELETE). Trigger ini berguna untuk **menjaga integritas data** dan **mencegah kesalahan**. 🚦

### **➤ Contoh Trigger: Log Perubahan Data**
Misalkan kita ingin mencatat setiap siswa yang dihapus ke tabel **log_siswa**:
```sql
CREATE TABLE log_siswa (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_siswa INT,
    nama VARCHAR(255),
    kelas VARCHAR(10),
    waktu_hapus TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
Sekarang kita buat trigger yang otomatis mencatat siswa yang dihapus:
```sql
DELIMITER $$
CREATE TRIGGER HapusSiswaLog
BEFORE DELETE ON siswa
FOR EACH ROW
BEGIN
    INSERT INTO log_siswa (id_siswa, nama, kelas)
    VALUES (OLD.id_siswa, OLD.nama, OLD.kelas);
END $$
DELIMITER ;
```
📌 **Penjelasan:**
- `BEFORE DELETE` → Trigger akan berjalan **sebelum siswa dihapus**.
- `INSERT INTO log_siswa` → Menyimpan data siswa yang dihapus.

Sekarang, jika kita menghapus siswa:
```sql
DELETE FROM siswa WHERE id_siswa = 5;
```
Data siswa akan masuk ke tabel **log_siswa** secara otomatis! 🔥

---

## **Kesimpulan**

🔥 **Stored Procedure** → Untuk menjalankan kumpulan perintah SQL secara berulang.
🔥 **Function** → Untuk menghitung dan mengembalikan satu nilai dari SQL.
🔥 **Trigger** → Untuk menjalankan perintah otomatis saat ada perubahan di tabel.

📌 **Singkatnya:**
- **Stored Procedure** = "Otomatisasi tugas SQL!" 🔄
- **Function** = "Menghitung sesuatu dan mengembalikan hasilnya!" 📊
- **Trigger** = "Jalankan aksi otomatis saat data berubah!" 🚀

Semoga materi ini mudah dipahami! Jika ada pertanyaan, tanya saja! 😊🔥


---
### **Navigasi**
Prev ⏮ [Materi 7: Fungsi Agregat dan Grouping Data](../7/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 9: Operasi Relasional & Transaksi Database](../9/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606