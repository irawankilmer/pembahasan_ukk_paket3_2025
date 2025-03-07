# **Materi 11: Penerapan Backup dan Restore Database**

## **Pendahuluan**

Bayangkan kamu punya **buku catatan penting** 📖 yang berisi semua data pentingmu. Apa yang terjadi kalau buku itu hilang atau rusak? 😱 **Semua data akan hilang selamanya!** Inilah kenapa kita harus selalu punya **salinan cadangan (backup).**

Di dunia database, **backup dan restore** sangat penting untuk **menghindari kehilangan data akibat kesalahan manusia, serangan hacker, atau kerusakan sistem**.

📌 **Backup (Cadangan Data)** = Menyimpan salinan database ke tempat lain 🔄
📌 **Restore (Mengembalikan Data)** = Mengembalikan database dari salinan cadangan 🔄

Mari kita bahas cara melakukannya di Windows menggunakan **XAMPP dan Command Prompt (CMD)!** 🚀

---

## **1️⃣ Cara Melakukan Backup Database di XAMPP (CMD)**

SQL menyediakan beberapa cara untuk melakukan backup database. Cara paling umum adalah menggunakan **MySQL Dump**, yang bisa dijalankan langsung dari CMD.

### **➤ Backup Database Menggunakan CMD di XAMPP**

Misalkan kita ingin mencadangkan database bernama **sekolah**.

1. **Buka Command Prompt (CMD)**
   - Tekan `Windows + R`, ketik `cmd`, lalu tekan `Enter`.

2. **Masuk ke folder MySQL di XAMPP**
   - Biasanya MySQL pada XAMPP terletak di:
     ```cmd
     cd C:\xampp\mysql\bin
     ```

3. **Jalankan perintah backup database:**
   ```cmd
   mysqldump -u root -p sekolah > C:\xampp\htdocs\backup\backup_sekolah.sql
   ```

📌 **Penjelasan:**

- `mysqldump` → Perintah untuk membuat backup database.
- `-u root` → Login sebagai pengguna **root** (default MySQL XAMPP).
- `-p` → Meminta password pengguna (kosong jika belum diatur).
- `sekolah` → Nama database yang ingin di-backup.
- `>` → Menyimpan hasil backup ke file.
- `C:\xampp\htdocs\backup\backup_sekolah.sql` → Lokasi penyimpanan file backup.

Sekarang kita punya file `backup_sekolah.sql` yang bisa digunakan untuk mengembalikan database kapan saja. ✅

### **➤ Backup Hanya Tabel Tertentu**

Jika ingin mencadangkan hanya tabel tertentu, misalnya **siswa** dan **guru**:

```cmd
mysqldump -u root -p sekolah siswa guru > C:\xampp\htdocs\backup\backup_siswa_guru.sql
```

📌 **Hanya tabel `siswa` dan `guru` yang disimpan dalam backup.**

### **➤ Backup Semua Database dalam Server**

```cmd
mysqldump -u root -p --all-databases > C:\xampp\htdocs\backup\backup_semua.sql
```

📌 **Mencadangkan semua database di server MySQL XAMPP.**

---

## **2️⃣ Cara Mengembalikan (Restore) Database di XAMPP (CMD)**

Jika terjadi kesalahan atau kehilangan data, kita bisa mengembalikan database dari file backup.

1. **Buka Command Prompt (CMD) dan masuk ke folder MySQL di XAMPP**
   ```cmd
   cd C:\xampp\mysql\bin
   ```

2. **Jalankan perintah restore database:**
   ```cmd
   mysql -u root -p sekolah < C:\xampp\htdocs\backup\backup_sekolah.sql
   ```

📌 **Penjelasan:**

- `mysql` → Perintah untuk masuk ke MySQL.
- `-u root -p` → Login sebagai root dan memasukkan password.
- `sekolah` → Nama database yang akan dipulihkan.
- `< C:\xampp\htdocs\backup\backup_sekolah.sql` → Menggunakan file backup untuk mengembalikan database.

### **➤ Restore Jika Database Belum Ada**

Jika database **sekolah** belum ada, kita harus membuatnya terlebih dahulu:

```cmd
mysql -u root -p -e "CREATE DATABASE sekolah;"
```

Lalu baru jalankan perintah restore seperti di atas.

### **➤ Restore Hanya Tabel Tertentu**

Jika ingin mengembalikan hanya tabel tertentu dari backup:

```cmd
mysql -u root -p sekolah < C:\xampp\htdocs\backup\backup_siswa_guru.sql
```

📌 **Hanya tabel `siswa` dan `guru` yang dipulihkan.**

---

## **3️⃣ Automatisasi Backup Database di Windows dengan XAMPP**

Agar tidak lupa melakukan backup, kita bisa **mengatur backup otomatis setiap hari** menggunakan **Task Scheduler di Windows**.

### **➤ Cara Backup Otomatis di Windows (Task Scheduler)**

1. **Buka Task Scheduler** (`Windows + R`, ketik `taskschd.msc`, tekan `Enter`).
2. Pilih **Create Basic Task**.
3. Beri nama **Backup MySQL XAMPP** dan klik **Next**.
4. Pilih **Daily** untuk backup setiap hari.
5. Pilih waktu backup (misalnya pukul 02:00 AM).
6. Pilih **Start a Program**.
7. Masukkan perintah berikut di kolom Program/script:
   ```cmd
   "C:\xampp\mysql\bin\mysqldump.exe"
   ```
8. Pada kolom **Add arguments**, masukkan:
   ```cmd
   -u root -pPASSWORD sekolah > C:\xampp\htdocs\backup\backup_sekolah_%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%.sql
   ```
   📌 **Sesuaikan PASSWORD dengan password MySQL XAMPP kamu!** 🔒
9. Klik **Finish**.

Sekarang database akan otomatis dicadangkan setiap hari ke folder `C:\xampp\htdocs\backup\` dengan format tanggal. 🚀

---

## **4️⃣ Tips Backup dan Restore Database**

✅ **Selalu buat backup sebelum melakukan perubahan besar!**
✅ **Simpan backup di tempat aman, misalnya cloud storage atau hard drive eksternal.**
✅ **Gunakan backup otomatis agar tidak lupa.**
✅ **Cek hasil backup sebelum menghapus data lama!**

---

## **Kesimpulan**

🔥 **Backup database penting untuk mencegah kehilangan data.**
🔥 **Restore database memungkinkan kita mengembalikan data jika terjadi kesalahan.**
🔥 **Gunakan CMD untuk backup manual atau Task Scheduler untuk backup otomatis.**
🔥 **Automatisasi backup memastikan database selalu terlindungi.**

📌 **Singkatnya:**

- **Backup = Cadangan Data** 🔄
- **Restore = Mengembalikan Data** 🔄
- **Automatisasi Backup = Perlindungan Jangka Panjang** 🔥

Semoga materi ini mudah dipahami! Kalau ada pertanyaan, tanya saja! 😊🚀



---
### **Navigasi**
Prev ⏮ [Materi 10: Optimasi Basis Data](../10/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 12: Pengujian dan Validasi Basis Data](../12/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606