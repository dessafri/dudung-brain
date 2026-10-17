# Clean Code & Coding Principles

Aturan coding yang berlaku di semua project, teknologi, dan bahasa.
Bukan dogma — pakai nalar. Tapi jika mau melanggar salah satunya, harus ada alasan yang bisa dijelaskan.

---

## 1. Ikuti yang sudah ada dulu

Sebelum menulis kode baru di repo yang sudah jalan:
- Baca konvensi yang sudah ada di file-file sekitarnya.
- Ikuti naming, struktur folder, pattern yang sudah dipakai.
- Jangan impor pattern baru hanya karena lebih "modern".

Aturan: **konsistensi > preferensi pribadi**.

---

## 2. Simpel dulu, kompleks hanya kalau perlu

Jangan over-engineer sebelum ada masalah nyata.

Tanda over-engineering:
- Abstraksi yang belum punya lebih dari 1 pengguna.
- Generic/reusable sebelum ada kebutuhan kedua yang jelas.
- Pola desain baru di codebase yang belum punya pondasi bersih.

Aturan: **tuliskan yang paling sederhana yang benar dulu**. Refactor kalau sudah terbukti perlu.

---

## 3. Nama yang jelas, bukan nama yang pintar

```
// Buruk
const d = new Date();
const fn = (x) => x * 1.1;

// Baik
const today = new Date();
const addTax = (price) => price * 1.1;
```

- Fungsi: kata kerja yang menjelaskan aksi (`getUserById`, `formatDate`).
- Variabel: kata benda yang menjelaskan isi (`userId`, `isLoading`, `totalPrice`).
- Boolean: awali dengan `is`, `has`, `can`, `should`.
- Hindari singkatan yang tidak universal (`cnt`, `tmp`, `val`, `data`).

---

## 4. Satu fungsi, satu tanggung jawab

Fungsi yang baik:
- Bisa dijelaskan dalam satu kalimat tanpa kata "dan".
- Muat di satu layar (sekitar 20-30 baris maks).
- Punya nama yang sudah menjelaskan isinya — tidak perlu komentar untuk paham apa yang dilakukan.

Kalau butuh komentar untuk jelaskan *apa* yang dilakukan, itu sinyal nama atau strukturnya masih buruk.
Komentar yang valid hanya untuk jelaskan *mengapa* keputusan itu diambil.

---

## 5. Jangan duplikasi logika

Logika yang sama muncul dua kali: sudah saatnya diekstrak.
Tapi ekstrak **hanya** kalau duplikasinya nyata, bukan karena "mungkin nanti dipakai lagi".

Aturan WET (Write Everything Twice): boleh duplikat sekali. Ketiga kali baru ekstrak.

---

## 6. Gagal cepat, gagal jelas

Validasi input di awal fungsi. Return early atau throw di kondisi invalid.
Jangan biarkan state invalid mengalir jauh ke dalam logika.

```
// Buruk: null bisa lolos jauh ke dalam
function process(user) {
  // ... 30 baris logika ...
  user.name.toLowerCase(); // crash di sini
}

// Baik: gagal cepat
function process(user) {
  if (!user?.name) throw new Error("user.name diperlukan");
  // logika berjalan dengan data yang sudah terverifikasi
}
```

---

## 7. Side effect harus eksplisit

Fungsi yang mengubah state di luar dirinya (global, database, network) harus:
- Namanya mencerminkan bahwa dia *melakukan sesuatu*, bukan hanya menghitung.
- Terpisah dari fungsi pure yang hanya menghitung/transform.

---

## 8. Jangan tinggalkan dead code

Kode yang dikomentasi, `TODO` yang umurnya > 1 sprint, variabel yang tidak dipakai: hapus saja.
Git history ada untuk alasan ini.

---

## 9. Error handling bukan afterthought

- Tangani error di tempat yang paling tahu cara mengatasinya.
- Jangan silent catch (`catch (e) {}`).
- Error message harus actionable: bukan "Something went wrong", tapi "File upload gagal: ukuran melebihi 10MB".

---

## 10. Test untuk logika yang penting, bukan untuk coverage angka

Test yang berguna:
- Happy path utama.
- Edge case yang pernah atau bisa menyebabkan bug.
- Logika bisnis yang tidak boleh regresi.

Test yang buang waktu:
- Test getter/setter tanpa logika.
- Test yang hanya memastikan kode berjalan tanpa assert yang bermakna.

---

## Kapan Boleh Melanggar

Aturan ini bukan absolut. Boleh dilanggar kalau:
- Ada constraint nyata (performa kritis, deadline darurat, API eksternal yang memaksa).
- Alasannya bisa dijelaskan dalam 1-2 kalimat ke anggota tim lain.
- Ditandai dengan komentar `// NOTE:` atau `// HACK:` agar tidak membingungkan orang berikutnya.
