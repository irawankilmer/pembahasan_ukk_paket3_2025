# **Materi 3: Pembuatan dan Implementasi Basis Data**

## **Pendahuluan**

Sebelum kita menyimpan data dalam database, kita perlu **menyiapkan "wadahnya"** terlebih dahulu. Dalam SQL, perintah yang digunakan untuk **membuat, mengubah, atau menghapus struktur database** disebut **DDL (Data Definition Language)**.

Bayangkan DDL ini seperti alat tukang bangunan. Kita bisa **membangun rumah (CREATE), merenovasi (ALTER), menghancurkan (DROP), mengganti nama (RENAME), atau mengosongkan isi rumah tanpa merobohkannya (TRUNCATE).** 🏗️

Mari kita bahas satu per satu!

---

## **1️⃣ CREATE DATABASE - Membuat Database Baru**

Sebelum bisa membuat tabel, kita harus membuat **database dulu**. Caranya seperti ini:

```sql
CREATE DATABASE sekolah;
```
📌 **Penjelasan:**
- Perintah ini membuat database bernama **sekolah**.
- Gunakan **SHOW DATABASES;** untuk melihat daftar database yang ada.
- Gunakan **USE sekolah;** untuk mulai menggunakan database tersebut.

---

## **2️⃣ CREATE TABLE - Membuat Tabel Baru**

Sekarang kita buat tabel dalam database **sekolah**, misalnya tabel **siswa**:

```sql
CREATE TABLE siswa (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    tanggal_lahir DATE,
    kelas VARCHAR(10)
);
```
📌 **Penjelasan:**
- **id_siswa** → Tipe **INT**, sebagai **Primary Key** dan **AUTO_INCREMENT** (bertambah otomatis).
- **nama** → Tipe **VARCHAR(255)**, wajib diisi (**NOT NULL**).
- **tanggal_lahir** → Tipe **DATE** untuk menyimpan tanggal.
- **kelas** → Tipe **VARCHAR(10)** untuk menyimpan kelas siswa.

---

## **3️⃣ ALTER TABLE - Mengubah Struktur Tabel**

Kadang kita butuh "merenovasi" tabel, seperti **menambah, menghapus, atau mengubah kolom**.

### **➤ Menambah Kolom**
Misal kita ingin menambahkan kolom **email** ke tabel siswa:
```sql
ALTER TABLE siswa ADD COLUMN email VARCHAR(255);
```

### **➤ Menghapus Kolom**
Kalau ternyata email tidak dibutuhkan, kita bisa menghapusnya:
```sql
ALTER TABLE siswa DROP COLUMN email;
```

### **➤ Mengubah Tipe Data Kolom**
Misal, kolom **kelas** awalnya VARCHAR(10), tapi ternyata butuh lebih panjang:
```sql
ALTER TABLE siswa MODIFY COLUMN kelas VARCHAR(20);
```

### **➤ Mengganti Nama Kolom**
Kita ingin mengganti **kelas** menjadi **tingkatan_kelas**:
```sql
ALTER TABLE siswa CHANGE COLUMN kelas tingkatan_kelas VARCHAR(20);
```

### **➤ Menambahkan Primary Key atau Foreign Key**
Kalau lupa menambahkan **Primary Key** saat awal:
```sql
ALTER TABLE siswa ADD PRIMARY KEY (id_siswa);
```
Kalau ingin menambahkan **Foreign Key** ke tabel **kelas**:
```sql
ALTER TABLE siswa ADD COLUMN id_kelas INT;
ALTER TABLE siswa ADD CONSTRAINT fk_kelas FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas);
```

---

## **4️⃣ DROP TABLE - Menghapus Tabel Secara Permanen**

Kalau tabel sudah tidak dibutuhkan sama sekali, kita bisa menghapusnya:
```sql
DROP TABLE siswa;
```
📌 **Hati-hati!** Data di dalam tabel juga akan ikut terhapus! 🚨

Kalau ingin menghapus seluruh database:
```sql
DROP DATABASE sekolah;
```
⚠️ **Pastikan database yang dihapus memang tidak dibutuhkan!**

---

## **5️⃣ RENAME TABLE - Mengganti Nama Tabel**

Misalkan kita ingin mengganti nama tabel **siswa** menjadi **murid**:
```sql
RENAME TABLE siswa TO murid;
```

Kalau mau mengganti lebih dari satu tabel sekaligus:
```sql
RENAME TABLE siswa TO murid, kelas TO tingkat;
```
📌 **Penjelasan:** Semua referensi yang menggunakan nama tabel lama harus diperbarui.

---

## **6️⃣ TRUNCATE TABLE - Menghapus Semua Data, Tapi Bukan Strukturnya**

Kalau kita ingin **menghapus semua isi tabel tanpa menghapus tabelnya**, gunakan **TRUNCATE**:
```sql
TRUNCATE TABLE siswa;
```
📌 **Perbedaan TRUNCATE dan DELETE:**
| **TRUNCATE** | **DELETE** |
|--------------|-----------|
| Menghapus semua data tanpa menyisakan apa pun | Bisa menghapus data dengan kondisi tertentu |
| Tidak bisa dibatalkan (**tidak bisa rollback**) | Bisa dibatalkan dengan **ROLLBACK** (jika dalam transaksi) |
| Lebih cepat | Lebih lambat |

---

## **Kesimpulan**

🔥 **CREATE DATABASE** → Membuat database baru.
🔥 **CREATE TABLE** → Membuat tabel baru.
🔥 **ALTER TABLE** → Mengubah struktur tabel (tambah/hapus/ubah kolom).
🔥 **DROP TABLE / DATABASE** → Menghapus tabel atau database.
🔥 **RENAME TABLE** → Mengubah nama tabel.
🔥 **TRUNCATE TABLE** → Menghapus semua data dalam tabel tanpa menghapus tabelnya.

📌 **Singkatnya:**
- **CREATE** = Membangun rumah baru 🏡
- **ALTER** = Merenovasi rumah 🔨
- **DROP** = Merobohkan rumah 🏚️
- **RENAME** = Ganti alamat rumah 🏠➡️🏡
- **TRUNCATE** = Kosongkan rumah tanpa merobohkan 🚪🚫

Semoga materi ini mudah dipahami! Kalau ada pertanyaan, silahkan langsung di gaskeun! 😊🚀

---
### **Navigasi**
Prev ⏮ [Materi 2: Perancangan Skema Basis Data](../2/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 4: Pengisian dan Pengelolaan Data](../4/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606