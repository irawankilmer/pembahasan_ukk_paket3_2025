# **BONUS: Keamanan Database (Pengelolaan User, Hak Akses, dan Perlindungan Data)**

## **Pendahuluan**

Dalam dunia basis data, **keamanan adalah prioritas utama**. Bayangkan jika data penting seperti informasi keuangan atau data pelanggan **bisa diakses oleh orang yang tidak berwenang**! 😱

📌 **Mengapa Keamanan Database Penting?**
✅ Mencegah akses tidak sah ke data 📌
✅ Melindungi data dari pencurian atau perusakan 🔒
✅ Memastikan pengguna hanya bisa mengakses informasi yang diperbolehkan 🔐
✅ Menghindari perubahan data yang tidak disengaja atau berbahaya ⚠️

Dalam SQL, keamanan database melibatkan **pengelolaan user, pemberian hak akses (GRANT), pencabutan akses (REVOKE), serta teknik perlindungan data lainnya**. Mari kita bahas satu per satu! 🚀

---

## **1️⃣ Pengelolaan User dalam Database**

### **➤ Melihat Daftar User yang Ada**
Untuk melihat daftar pengguna yang memiliki akses ke database, gunakan:
```sql
SELECT User, Host FROM mysql.user;
```
📌 **Menampilkan semua user yang terdaftar di MySQL.** ✅

### **➤ Membuat User Baru**
Misalkan kita ingin membuat user **'agus'** yang hanya bisa login dari komputer lokal:
```sql
CREATE USER 'agus'@'localhost' IDENTIFIED BY 'password123';
```
📌 **User ini hanya bisa mengakses database dari komputer lokal (localhost).** 🔒

Jika ingin memberikan akses dari semua komputer dalam jaringan:
```sql
CREATE USER 'agus'@'%' IDENTIFIED BY 'password123';
```
📌 **Sekarang user bisa mengakses database dari mana saja.** ⚠️ (Gunakan dengan hati-hati!)

### **➤ Mengubah Password User**
Jika ingin mengganti password user:
```sql
ALTER USER 'agus'@'localhost' IDENTIFIED BY 'passwordBaru!';
```
📌 **Gantilah password secara berkala untuk meningkatkan keamanan.** 🔐

### **➤ Menghapus User**
Jika user tidak lagi diperlukan, kita bisa menghapusnya:
```sql
DROP USER 'agus'@'localhost';
```
📌 **Hati-hati! Setelah dihapus, user tidak bisa login lagi.** ❌

---

## **2️⃣ Pemberian Hak Akses dengan GRANT**

Secara default, user baru **tidak memiliki hak akses apa pun**. Kita harus memberikan hak akses yang diperlukan menggunakan perintah **GRANT**.

### **➤ Memberikan Hak Akses ke Database**
Misalnya kita ingin memberikan user **'agus'** akses penuh ke database **sekolah**:
```sql
GRANT ALL PRIVILEGES ON sekolah.* TO 'agus'@'localhost';
```
📌 **Sekarang user 'agus' bisa melakukan semua operasi di database `sekolah`.** ✅

Jika kita hanya ingin memberikan akses **membaca data (SELECT)**:
```sql
GRANT SELECT ON sekolah.* TO 'agus'@'localhost';
```
📌 **User 'agus' hanya bisa membaca data, tapi tidak bisa mengedit atau menghapusnya.** 🔍

Jika ingin memberikan hak akses hanya untuk satu tabel tertentu:
```sql
GRANT SELECT, INSERT ON sekolah.siswa TO 'agus'@'localhost';
```
📌 **User hanya bisa membaca dan menambahkan data di tabel `siswa`, tapi tidak bisa menghapus atau mengeditnya.** 🛡️

---

## **3️⃣ Mencabut Hak Akses dengan REVOKE**

Jika user tidak lagi memerlukan akses tertentu, kita bisa **mencabut izin** dengan perintah **REVOKE**.

### **➤ Menghapus Hak Akses ke Database**
```sql
REVOKE ALL PRIVILEGES ON sekolah.* FROM 'agus'@'localhost';
```
📌 **User 'agus' tidak lagi memiliki akses ke database `sekolah`.** 🚫

### **➤ Menghapus Hak Akses Tertentu**
Jika hanya ingin menghapus izin INSERT di tabel `siswa`:
```sql
REVOKE INSERT ON sekolah.siswa FROM 'agus'@'localhost';
```
📌 **Sekarang user 'agus' tetap bisa membaca data, tapi tidak bisa menambahkan data baru.**

---

## **4️⃣ Perlindungan Data dalam Database**

Selain mengelola user dan hak akses, kita juga harus melindungi data dari berbagai ancaman.

### **➤ Menggunakan Backup Data secara Rutin**
Selalu lakukan backup untuk menghindari kehilangan data akibat serangan atau kesalahan manusia:
```cmd
mysqldump -u root -p sekolah > C:\backup\backup_sekolah.sql
```
📌 **Backup harus disimpan di lokasi aman, seperti cloud storage atau server lain.**

### **➤ Mengenkripsi Password dalam Database**
Jangan simpan password dalam bentuk teks biasa! Gunakan fungsi **HASHING** seperti **SHA2()**:
```sql
UPDATE user SET password = SHA2('password123', 256) WHERE username = 'agus';
```
📌 **Sekarang password tersimpan dalam bentuk terenkripsi.** 🔒

### **➤ Membatasi Jumlah Percobaan Login (Brute Force Protection)**
Jika database sering diserang dengan percobaan login berulang, batasi jumlah login gagal dengan trigger:
```sql
CREATE TRIGGER login_gagal
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    IF NEW.attempts >= 3 THEN
        UPDATE user SET status = 'TERKUNCI' WHERE id = NEW.id;
    END IF;
END;
```
📌 **User akan terkunci setelah 3 kali gagal login.** 🔐

### **➤ Audit Log untuk Memonitor Aktivitas User**
Jika ingin melihat siapa yang mengakses database dan melakukan perubahan:
```sql
SELECT * FROM mysql.general_log;
```
📌 **Catat semua aktivitas pengguna untuk mencegah penyalahgunaan.** 🕵️‍♂️

---

## **Kesimpulan**

🔥 **Pengelolaan user memastikan hanya orang yang berhak yang bisa mengakses database.**
🔥 **GRANT memberikan hak akses yang sesuai dengan kebutuhan pengguna.**
🔥 **REVOKE mencabut hak akses yang tidak diperlukan.**
🔥 **Perlindungan data mencegah kehilangan atau pencurian informasi.**

📌 **Singkatnya:**
- **Buat user dengan akses yang dibatasi** 🔐
- **Gunakan GRANT untuk memberikan hak akses** ✅
- **Gunakan REVOKE untuk mencabut izin yang tidak perlu** 🚫
- **Lindungi database dengan backup, enkripsi, dan audit log** 🛡️

Semoga materi ini mudah dipahami! Jika ada pertanyaan, tanyakan saja! 😊🚀

