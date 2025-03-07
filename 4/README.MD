# **Materi 4: Pengisian dan Pengelolaan Data (INSERT, UPDATE, DELETE, SELECT)**

## **Pendahuluan**

Setelah kita membuat database dan tabel, sekarang saatnya **mengisi dan mengelola data**! Ini seperti kita sudah membangun rumah, sekarang kita perlu menambahkan perabotan, mengganti yang rusak, dan membuang yang tidak diperlukan. 🏡

Di SQL, kita menggunakan **DML (Data Manipulation Language)** untuk mengelola data dalam tabel. Perintah utamanya adalah:
- **INSERT** → Menambahkan data ke tabel.
- **UPDATE** → Mengubah data yang sudah ada.
- **DELETE** → Menghapus data.
- **SELECT** → Mengambil data untuk ditampilkan.

Mari kita bahas satu per satu! 🚀

---

## **1️⃣ INSERT - Menambahkan Data ke Tabel**

Jika tabel sudah ada, kita bisa memasukkan data dengan **INSERT INTO**.

### **➤ Contoh: Menambahkan Data Siswa**
Misalkan kita punya tabel **siswa** seperti ini:
```sql
CREATE TABLE siswa (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    tanggal_lahir DATE,
    kelas VARCHAR(10)
);
```
Sekarang kita masukkan data siswa baru:
```sql
INSERT INTO siswa (nama, tanggal_lahir, kelas)
VALUES ('Ach Fajar Rinjani', '2005-08-15', '12 RPL');
```
📌 **Penjelasan:**
- Kita **tidak perlu mengisi id_siswa**, karena **AUTO_INCREMENT**.
- Kolom yang diisi harus sesuai dengan urutan di `INSERT INTO`.

### **➤ Menambahkan Banyak Data Sekaligus**
```sql
INSERT INTO siswa (nama, tanggal_lahir, kelas) VALUES
('Agus Hidayat', '2006-02-10', '11 TKJ'),
('Ai Riyanti', '2005-11-20', '12 RPL'),
('Alfa Nur Fadilah', '2007-01-05', '10 MM');
```
📌 Lebih cepat daripada memasukkan satu per satu. ✅

---

## **2️⃣ UPDATE - Mengubah Data dalam Tabel**

Kalau ada kesalahan atau ingin mengubah data, gunakan **UPDATE**.

### **➤ Contoh: Mengubah Kelas Siswa**
```sql
UPDATE siswa SET kelas = '12 TKJ' WHERE nama = 'Agus Hidayat';
```
📌 **Penjelasan:**
- **SET** menentukan kolom yang ingin diubah.
- **WHERE** memastikan hanya data yang sesuai yang diperbarui. ⚠️ Tanpa `WHERE`, semua data akan berubah!

### **➤ Mengubah Beberapa Kolom Sekaligus**
```sql
UPDATE siswa
SET kelas = '12 RPL', tanggal_lahir = '2005-07-01'
WHERE nama = 'Ai Riyanti';
```

---

## **3️⃣ DELETE - Menghapus Data dalam Tabel**

Kalau ada data yang tidak diperlukan, kita bisa menghapusnya dengan **DELETE**.

### **➤ Contoh: Menghapus Siswa Tertentu**
```sql
DELETE FROM siswa WHERE nama = 'Alfa Nur Fadilah';
```
📌 **Hati-hati!** Jika lupa menambahkan **WHERE**, semua data akan terhapus! 😱

### **➤ Menghapus Semua Data dalam Tabel (Tapi Struktur Tetap Ada)**
```sql
DELETE FROM siswa;
```
📌 Alternatif lebih cepat: `TRUNCATE TABLE siswa;` 🚀

---

## **4️⃣ SELECT - Mengambil Data dari Tabel**

Setelah memasukkan data, kita perlu **melihat atau mencari data** dengan **SELECT**.

### **➤ Menampilkan Semua Data dalam Tabel**
```sql
SELECT * FROM siswa;
```
📌 **`*` berarti semua kolom akan ditampilkan.**

### **➤ Menampilkan Kolom Tertentu**
```sql
SELECT nama, kelas FROM siswa;
```

### **➤ Menampilkan Data dengan Filter (WHERE)**
```sql
SELECT * FROM siswa WHERE kelas = '12 RPL';
```
📌 Hanya siswa dari kelas **12 RPL** yang ditampilkan. ✅

### **➤ Mencari Data dengan Pola (LIKE & WILDCARD)**
```sql
SELECT * FROM siswa WHERE nama LIKE 'A%';
```
📌 Menampilkan siswa yang namanya **diawali huruf 'A'**.
- `%` = semua karakter setelahnya bisa apa saja.

### **➤ Menampilkan Data dalam Urutan Tertentu (ORDER BY)**
```sql
SELECT * FROM siswa ORDER BY nama ASC;
```
📌 **ASC** = Urutan A-Z (naik). **DESC** = Urutan Z-A (turun).

### **➤ Menghitung Jumlah Data (COUNT, MAX, MIN, AVG, SUM)**
```sql
SELECT COUNT(*) AS jumlah_siswa FROM siswa;
```
📌 Menampilkan jumlah total siswa dalam tabel.

---

## **Kesimpulan**

🔥 **INSERT INTO** → Menambahkan data ke tabel.
🔥 **UPDATE** → Mengubah data yang sudah ada.
🔥 **DELETE** → Menghapus data dari tabel.
🔥 **SELECT** → Mengambil data untuk ditampilkan.

📌 **Singkatnya:**
- **INSERT** = Menambah siswa baru 📝
- **UPDATE** = Mengedit data siswa ✏️
- **DELETE** = Mengeluarkan siswa 🚪
- **SELECT** = Melihat daftar siswa 👀

Semoga materi ini mudah dipahami! Jika ada pertanyaan, tanyakan saja! 😊🚀



---
### **Navigasi**
Prev ⏮ [Materi 3: Pembuatan dan Implementasi Basis Data](../3/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 5: Definisi Relasi Antar Tabel](../5/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606