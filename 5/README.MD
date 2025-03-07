# **Materi 5: Definisi Relasi Antar Tabel (JOIN dalam SQL)**

## **Pendahuluan**

Setelah kita bisa memasukkan dan mengelola data dalam tabel, sekarang kita belajar bagaimana **menghubungkan data dari beberapa tabel** menggunakan **JOIN**.

Bayangkan kita punya dua lemari arsip: satu berisi data siswa, satu lagi berisi nilai mereka. Jika kita ingin melihat **nama siswa beserta nilai mereka**, kita harus **menghubungkan kedua lemari**. Dalam SQL, proses ini disebut **JOIN**! 🏗️🔗

---

## **1️⃣ Jenis-Jenis JOIN dalam SQL**

| **JOIN** | **Fungsi** |
|----------|-----------|
| **INNER JOIN** | Mengambil data yang cocok di kedua tabel |
| **LEFT JOIN** | Mengambil semua data dari tabel kiri + yang cocok di tabel kanan |
| **RIGHT JOIN** | Mengambil semua data dari tabel kanan + yang cocok di tabel kiri |
| **CROSS JOIN** | Menghasilkan semua kombinasi data dari kedua tabel |
| **SELF JOIN** | Menghubungkan tabel dengan dirinya sendiri |

Mari kita bahas satu per satu dengan contoh! 🚀

---

## **2️⃣ INNER JOIN – Menampilkan Data yang Cocok di Kedua Tabel**

INNER JOIN hanya mengambil **data yang cocok di kedua tabel**.

### **Contoh Kasus:**
Kita punya dua tabel:

🔹 **Tabel siswa**
| id_siswa | nama         | kelas  |
|----------|------------|-------|
| 1        | Agus       | 12 RPL |
| 2        | Budi       | 11 TKJ |
| 3        | Citra      | 10 MM  |

🔹 **Tabel nilai**
| id_nilai | id_siswa | mata_pelajaran | nilai |
|----------|---------|----------------|------|
| 1        | 1       | Matematika     | 85   |
| 2        | 2       | Matematika     | 90   |

📌 **Query INNER JOIN:**
```sql
SELECT siswa.nama, siswa.kelas, nilai.mata_pelajaran, nilai.nilai
FROM siswa
INNER JOIN nilai ON siswa.id_siswa = nilai.id_siswa;
```

📌 **Hasil:**
| nama | kelas  | mata_pelajaran | nilai |
|------|-------|----------------|------|
| Agus | 12 RPL | Matematika     | 85   |
| Budi | 11 TKJ | Matematika     | 90   |

🔹 **Kenapa Citra tidak muncul?** Karena dia tidak memiliki nilai di tabel **nilai**.

---

## **3️⃣ LEFT JOIN – Menampilkan Semua Data dari Tabel Kiri + yang Cocok di Tabel Kanan**

LEFT JOIN mengambil **semua data dari tabel kiri** dan **data yang cocok dari tabel kanan**. Jika tidak ada kecocokan, SQL akan mengisi dengan **NULL**.

📌 **Query LEFT JOIN:**
```sql
SELECT siswa.nama, siswa.kelas, nilai.mata_pelajaran, nilai.nilai
FROM siswa
LEFT JOIN nilai ON siswa.id_siswa = nilai.id_siswa;
```

📌 **Hasil:**
| nama  | kelas  | mata_pelajaran | nilai |
|-------|-------|----------------|------|
| Agus  | 12 RPL | Matematika     | 85   |
| Budi  | 11 TKJ | Matematika     | 90   |
| Citra | 10 MM  | NULL           | NULL |

🔹 **Kenapa Citra muncul?** Karena dia ada di tabel **siswa**, meskipun tidak ada di tabel **nilai**.

---

## **4️⃣ RIGHT JOIN – Menampilkan Semua Data dari Tabel Kanan + yang Cocok di Tabel Kiri**

RIGHT JOIN bekerja **kebalikan dari LEFT JOIN**.

📌 **Query RIGHT JOIN:**
```sql
SELECT siswa.nama, siswa.kelas, nilai.mata_pelajaran, nilai.nilai
FROM siswa
RIGHT JOIN nilai ON siswa.id_siswa = nilai.id_siswa;
```

📌 **Hasilnya sama dengan INNER JOIN**, karena semua siswa di **tabel nilai** sudah ada di tabel **siswa**.

---

---

## **5️⃣ CROSS JOIN – Menghasilkan Semua Kombinasi Data dari Kedua Tabel**

CROSS JOIN menghubungkan **setiap baris di tabel pertama** dengan **setiap baris di tabel kedua**.

📌 **Query CROSS JOIN:**
```sql
SELECT siswa.nama, nilai.mata_pelajaran, nilai.nilai
FROM siswa
CROSS JOIN nilai;
```
📌 **Hasilnya:** Semua kombinasi siswa dan nilai (bukan hanya yang cocok).

---

## **6️⃣ SELF JOIN – Menghubungkan Tabel dengan Dirinya Sendiri**

Kadang kita ingin membandingkan data dalam **tabel yang sama**.

📌 **Contoh: Mencari siswa yang berada di kelas yang sama**
```sql
SELECT A.nama AS siswa1, B.nama AS siswa2, A.kelas
FROM siswa A
JOIN siswa B ON A.kelas = B.kelas AND A.id_siswa != B.id_siswa;
```
📌 **Penjelasan:**
- Tabel **siswa** disebut dua kali (**A dan B**).
- `A.kelas = B.kelas` memastikan kedua siswa dari kelas yang sama.
- `A.id_siswa != B.id_siswa` supaya tidak membandingkan siswa dengan dirinya sendiri.

---

## **Kesimpulan**

🔥 **INNER JOIN** → Hanya data yang cocok. <br>
🔥 **LEFT JOIN** → Semua dari kiri + yang cocok di kanan.<br>
🔥 **RIGHT JOIN** → Semua dari kanan + yang cocok di kiri.<br>
🔥 **CROSS JOIN** → Semua kombinasi data.<br>
🔥 **SELF JOIN** → Menghubungkan tabel dengan dirinya sendiri.

📌 **Singkatnya:**
- **INNER JOIN** = Cari teman yang sama-sama suka sepak bola ⚽
- **LEFT JOIN** = Semua temanmu, walaupun ada yang tidak suka sepak bola 🏆
- **RIGHT JOIN** = Semua fans sepak bola, meskipun bukan temanmu 🏅
- **FULL JOIN** = Semua orang, baik yang suka atau tidak 🎭

Semoga mudah dipahami! Kalau ada pertanyaan, tanya saja! 😊🚀



---
### **Navigasi**
Prev ⏮ [Materi 4: Pengisian dan Pengelolaan Data](../4/README.MD) <br>
Home 🏠 [Halaman Utama](../README.MD) <br>
Next ⏭ [Materi 6: Pencarian dan Penyaringan Data dengan Query SQL](../6/README.MD)

**Note:** Jika ada yang perlu ditanyakan, silahkan hubungi saya di no WA yang ujungnya 9200 atau 4606