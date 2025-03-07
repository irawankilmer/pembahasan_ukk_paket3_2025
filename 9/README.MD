# **Materi 9: Operasi Relasional & Transaksi Database**

## **Pendahuluan**

Dalam sistem database, sering kali kita melakukan banyak operasi sekaligus, misalnya **menambah data, memperbarui stok barang, atau memproses pembayaran**. Namun, bagaimana kalau listrik tiba-tiba mati di tengah transaksi? 🔌⚡

Jika sistem tidak memiliki mekanisme transaksi, data bisa **berantakan atau tidak konsisten**. Untuk menghindari ini, SQL menyediakan konsep **transaksi database** dengan perintah utama **COMMIT** dan **ROLLBACK**. Mari kita bahas sampai ke akar-akarnya! 🚀

---

## **1️⃣ Apa Itu Transaksi dalam Database?**

🔹 **Transaksi adalah sekumpulan operasi SQL yang harus dieksekusi secara utuh atau dibatalkan sepenuhnya.**

Contoh sederhana transaksi dalam kehidupan sehari-hari:
✅ Anda menarik uang di ATM.
✅ Saldo di bank harus berkurang.
✅ Uang harus keluar dari mesin ATM.
✅ Jika ada gangguan di tengah proses, uang **tidak boleh keluar**, dan saldo **tidak boleh berkurang**.

Di SQL, transaksi memastikan bahwa data tetap **konsisten** meskipun ada kegagalan sistem. 🎯

---

## **2️⃣ Konsep ACID dalam Transaksi Database**

ACID adalah **empat aturan utama** yang membuat transaksi database aman dan andal:

| **Prinsip** | **Penjelasan** |
|------------|--------------|
| **A (Atomicity)** | Semua operasi dalam transaksi harus berhasil **sepenuhnya** atau gagal **sepenuhnya**. |
| **C (Consistency)** | Data harus selalu dalam keadaan konsisten sebelum dan sesudah transaksi. |
| **I (Isolation)** | Transaksi harus dieksekusi **secara independen** dari transaksi lain. |
| **D (Durability)** | Setelah transaksi selesai, perubahan harus **tetap tersimpan**, bahkan jika sistem mati. |

📌 **Kesimpulan:** ACID memastikan bahwa transaksi **tidak setengah-setengah** dan data tetap aman. ✅

---

## **3️⃣ Memulai Transaksi dalam SQL**

Sebelum menggunakan COMMIT atau ROLLBACK, kita harus **memulai transaksi** dengan `START TRANSACTION`.

```sql
START TRANSACTION;
```
📌 Setelah ini, semua perintah SQL akan dianggap sebagai satu transaksi hingga kita menjalankan **COMMIT** atau **ROLLBACK**.

---

## **4️⃣ COMMIT – Menyimpan Perubahan ke Database**

COMMIT digunakan untuk **menyimpan perubahan secara permanen**.

### **➤ Contoh: Menambahkan Data dengan Transaksi**
```sql
START TRANSACTION;
INSERT INTO siswa (nama, kelas) VALUES ('Budi Santoso', '12 RPL');
COMMIT;
```
📌 **Jika COMMIT berhasil, data akan tersimpan secara permanen.**

### **➤ Contoh: Mengupdate Data dengan Transaksi**
```sql
START TRANSACTION;
UPDATE siswa SET kelas = '12 TKJ' WHERE nama = 'Agus Hidayat';
COMMIT;
```
📌 **Setelah COMMIT, perubahan akan tersimpan secara final.**

---

## **5️⃣ ROLLBACK – Membatalkan Perubahan Jika Ada Kesalahan**

Jika ada kesalahan dalam transaksi, kita bisa menggunakan **ROLLBACK** untuk membatalkan perubahan sebelum COMMIT.

### **➤ Contoh: Membatalkan Insert Data Jika Salah**
```sql
START TRANSACTION;
INSERT INTO siswa (nama, kelas) VALUES ('Citra Dewi', '11 TKJ');
ROLLBACK;
```
📌 **Karena ROLLBACK dijalankan, data 'Citra Dewi' tidak akan tersimpan di database.**

### **➤ Contoh: Membatalkan Update Data Jika Salah**
```sql
START TRANSACTION;
UPDATE siswa SET kelas = '12 IPA' WHERE nama = 'Budi Santoso';
ROLLBACK;
```
📌 **Karena ROLLBACK, perubahan kelas 'Budi Santoso' batal.**

---

## **6️⃣ SAVEPOINT – Menyimpan Titik Checkpoint dalam Transaksi**

Kadang kita ingin menyimpan titik checkpoint di tengah transaksi agar bisa **rollback sebagian** tanpa membatalkan semuanya.

### **➤ Contoh: Menggunakan SAVEPOINT**
```sql
START TRANSACTION;
INSERT INTO siswa (nama, kelas) VALUES ('Dewi Lestari', '10 MM');
SAVEPOINT simpan1;
INSERT INTO siswa (nama, kelas) VALUES ('Eko Saputra', '10 MM');
ROLLBACK TO simpan1;
COMMIT;
```
📌 **Hasilnya:**
- **'Dewi Lestari' tetap tersimpan** (karena COMMIT).
- **'Eko Saputra' dibatalkan** (karena ROLLBACK TO simpan1).

---

## **7️⃣ Contoh Transaksi Nyata: Transfer Uang**

Misalkan kita ingin membuat transaksi untuk **transfer uang antar rekening**:

```sql
START TRANSACTION;

-- Kurangi saldo pengirim
UPDATE rekening SET saldo = saldo - 500000 WHERE nama = 'Andi';

-- Tambah saldo penerima
UPDATE rekening SET saldo = saldo + 500000 WHERE nama = 'Budi';

-- Jika semua berhasil, simpan transaksi
COMMIT;
```
📌 **Jika ada kesalahan (misalnya saldo tidak cukup), kita bisa ROLLBACK.**

```sql
ROLLBACK;
```
📌 **Saldo Andi tetap utuh, tidak ada uang yang hilang.** 🔥

---

## **Kesimpulan**

🔥 **START TRANSACTION** → Memulai transaksi.
🔥 **COMMIT** → Menyimpan perubahan ke database.
🔥 **ROLLBACK** → Membatalkan transaksi jika terjadi kesalahan.
🔥 **SAVEPOINT** → Menyimpan checkpoint dalam transaksi.
🔥 **ACID Properties** → Menjamin transaksi tetap aman dan konsisten.

📌 **Singkatnya:**
- **START TRANSACTION** = "Mulai transaksi!" 🚦
- **COMMIT** = "Simpan perubahan secara permanen!" ✅
- **ROLLBACK** = "Batalkan semuanya kalau ada kesalahan!" ❌
- **SAVEPOINT** = "Simpan checkpoint biar bisa rollback sebagian!" 🔄

Semoga materi ini mudah dipahami! Kalau ada pertanyaan, tanya saja! 😊🔥


---
### **Navigasi**
Prev ⏮ [Materi 8: Pembuatan Stored Procedure, Function, dan Trigger](../8/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 10: Optimasi Basis Data](../10/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606