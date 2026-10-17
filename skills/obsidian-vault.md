---
name: obsidian-vault
description: Use when working with Obsidian vault, notes, or RCA.
version: 2.0.0
---

# Obsidian Vault

Integrasi filesystem-first dengan vault Obsidian lokal pengguna.

## Lokasi Vault
- Path: `~/Documents/Obsidian Vault` (atau env var `OBSIDIAN_VAULT_PATH`).

## Struktur Vault
- `00-Inbox/` — tangkapan cepat, unorganized
- `10-Daily/` — daily note (`YYYY-MM-DD.md`)
- `20-Projects/` — per-proyek notes
- `30-Research/` — riset & benchmark
- `40-Knowledge/` — knowledge base atomik, evergreen, RCA
- `50-Agent-Log/` — log aktivitas perubahan agent
- `90-Templates/` — template note
- `_Attachments/` — media / lampiran

## Aturan Keselamatan
- Tidak menghapus file tanpa konfirmasi eksplisit.
- Menulis secara append atau note baru.
- Beri tag `agent-generated` pada note baru.
- Hubungkan dengan wikilink `[[Nama Note]]`.
