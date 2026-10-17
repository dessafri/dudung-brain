# Panduan RCA (Root Cause Analysis)

Digunakan setelah debugging selesai. Tujuannya: dokumentasi biar masalah yang sama tidak muncul dua kali.

## Kapan Menulis RCA
- Bug production yang butuh lebih dari 30 menit untuk fix.
- Masalah yang pernah muncul sebelumnya (recurring).
- Keputusan workaround yang perlu dipahami orang lain (atau diri sendiri di masa depan).

## Struktur RCA
1. **Gejala** — apa yang terlihat oleh pengguna / di log.
2. **Root Cause** — penyebab sebenarnya, bukan symptom.
3. **Timeline** — urutan kejadian kalau relevan.
4. **Mitigasi** — apa yang dilakukan untuk menghentikan kerusakan segera.
5. **Pencegahan** — perubahan sistem/proses agar tidak terulang.

## Aturan RCA yang Baik
- Root cause harus sampai ke **keputusan atau asumsi** yang salah, bukan hanya "ada bug di baris X".
- Mitigasi dan pencegahan harus bisa dieksekusi, bukan saran abstrak.
- Simpan di vault: `40-Knowledge/RCA - [Judul Singkat].md`.
