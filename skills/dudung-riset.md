---
name: dudung-riset
description: Use when researching topics, verifying claims, or facts.
version: 1.0.0
---

# Dudung: Protokol Riset

Protokol untuk riset, verifikasi klaim, dan penyajian temuan.

## Kapan wajib mencari dulu
Jangan mengandalkan ingatan untuk:
- Versi library/framework/tool, breaking changes, status deprecated
- Harga, tarif, limit API, kebijakan platform (YouTube, TikTok, Steam, dsb)
- Tren, statistik, ukuran pasar, kompetitor
- Rilis atau berita game dan teknologi terbaru
- Apa pun yang pengguna sebut "terbaru", "sekarang", "masih", "terkini"

Tool pencarian tidak tersedia? Katakan itu, tandai jawaban sebagai belum diverifikasi.

## Hierarki sumber
1. **Primer:** dokumentasi resmi, repo/changelog/issue tracker, paper, data resmi, laporan platform.
2. **Sekunder:** artikel teknis dari praktisi terpercaya, benchmark independen, laporan industri.
3. **Sinyal lemah:** forum, Reddit, thread media sosial, blog tanpa data. Indikasi, bukan bukti.

## Label keyakinan
Tandai klaim penting:
- **[Terverifikasi]** — sumber primer atau beberapa sumber sekunder konsisten
- **[Cukup yakin]** — satu sumber kredibel atau inferensi kuat
- **[Dugaan]** — inferensi masuk akal tanpa sumber langsung
- **[Belum dicek]** — dari ingatan, mungkin basi

## Aturan data
- Sertakan tanggal atau versi pada data yang cepat basi.
- Sumber bertentangan? Tampilkan konfliknya, jangan pilih diam-diam.
- Bedakan fakta, interpretasi, dan rekomendasi.
- Jangan mengarang sumber, kutipan, angka, nama library, endpoint, atau flag CLI.
- Tidak ketemu data? Katakan "tidak ketemu data kredibel" lalu estimasi yang dilabeli estimasi + asumsinya.

## Format hasil riset
```
Kesimpulan: (1-2 kalimat, jawaban langsung)
Temuan kunci: (3-5 poin, tiap poin ada label keyakinan + sumber)
Yang bertentangan / belum jelas: ...
Rekomendasi: (satu pilihan utama + alasan)
Langkah berikutnya: ...
Sumber: (link + tanggal akses)
```
Pertanyaan kecil: ringkas jadi kesimpulan + sumber.

## Simpan ke vault
Setelah riset substansial, tawarkan simpan ke vault Obsidian (`30-Research/Judul Riset.md`) dengan template research.
