# dudung-brain

Repositori konfigurasi Dudung — AI sparring partner teknis berbasis Hermes Agent.

Berisi soul, konteks pengguna, skill, prinsip coding, aturan kerja, dan template knowledge.

---

## Struktur

```
dudung-brain/
├── soul/
│   └── SOUL.md               # Identitas & karakter Dudung (→ ~/.hermes/SOUL.md)
│
├── context/
│   ├── USER_PROFILE.md       # Profil pengguna: peran, gaya kerja, preferensi
│   ├── TECH_STACK.md         # Stack & ekosistem teknologi aktif
│   └── PROJECTS.md           # Daftar proyek aktif + konteks singkat
│
├── skills/
│   ├── dudung-coding.md      # Protokol: alur coding, debugging, code review, arsitektur
│   ├── dudung-riset.md       # Protokol: riset, verifikasi klaim, hierarki sumber
│   ├── dudung-brainstorm.md  # Protokol: brainstorming, side hustle, evaluasi ide, konten
│   └── obsidian-vault.md     # Protokol: integrasi vault Obsidian sebagai memori jangka panjang
│
├── design/
│   └── CLEAN_CODE.md         # Prinsip clean code agnostik stack: naming, SRP, no over-engineering
│
├── rules/
│   ├── RULES.md              # Aturan operasional: verifikasi, keselamatan, konfirmasi destruktif
│   └── ANTI_SYCOPHANCY.md    # Protokol anti-penjilat: no bullsh*t, koreksi langsung, tahan posisi
│
└── knowledge/
    ├── RCA_GUIDE.md          # Panduan menulis Root Cause Analysis
    └── templates/
        ├── RCA_TEMPLATE.md       # Template catatan RCA
        ├── RESEARCH_TEMPLATE.md  # Template catatan riset
        └── DECISION_RECORD.md    # Template catatan keputusan teknis (kenapa X bukan Y)
```

---

## Cara Pakai

### 1. Soul aktif di Hermes
```
~/.hermes/SOUL.md  ←  salin / symlink dari soul/SOUL.md
```
SOUL.md adalah slot #1 system prompt Hermes. Isinya menentukan siapa Dudung.

### 2. Skills terdaftar di Hermes
Skills di folder `skills/` sudah di-deploy ke `~/.hermes/skills/` via `skill_manage`.
Hermes memuat skill otomatis saat konteks relevan terdeteksi.

### 3. Vault Obsidian sebagai memori
Catatan RCA, riset, dan keputusan penting disimpan ke vault Obsidian:
- `~/Documents/Obsidian Vault/40-Knowledge/`
- `~/Documents/Obsidian Vault/30-Research/`

Template di `knowledge/templates/` dipakai sebagai format standar.

---

## Alur Update

1. Edit file di repo ini.
2. Sinkronisasi manual ke `~/.hermes/SOUL.md` atau `skill_manage patch` untuk skills.
3. Commit ke repo ini sebagai source of truth.

---

## Prinsip

- **Soul** = siapa Dudung (karakter, prinsip, nada).
- **Context** = siapa pengguna dan apa yang sedang dikerjakan.
- **Skills** = prosedur spesifik dimuat saat relevan (hemat token).
- **Design** = standar kualitas kode yang berlaku di semua project.
- **Rules** = batas dan aturan operasional yang tidak boleh dilanggar.
- **Knowledge** = template dan panduan untuk dokumentasi yang bertahan lama.
