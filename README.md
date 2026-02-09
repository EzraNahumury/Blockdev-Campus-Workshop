# Base Blockdev Campus Workshop

## Instalasi Foundry
1. Buka terminal (Linux/macOS) atau Git Bash/WSL (Windows).
2. Jalankan `curl -L https://foundry.paradigm.xyz | bash`
3. Restart terminal, lalu jalankan `foundryup`
4. Verifikasi: `forge --version`, `cast --version`, `anvil --version`, `chisel --version`

Catatan Windows: Foundryup membutuhkan Git Bash atau WSL; PowerShell/CMD tidak didukung.

## Ringkasan Materi
- Solidity 101: Tipe data dasar (value types vs reference types) dan data location `memory`/`storage`/`calldata`.
- Solidity 102: `struct` untuk tipe data kustom; `enum` untuk himpunan state terbatas dengan nilai default member pertama.
- Solidity 103: `mapping` untuk relasi key-value (tanpa length dan default value otomatis) serta array fixed/dynamic dengan indeks mulai dari 0.
- Solidity 104: `modifier` untuk aturan/validasi yang deklaratif; `event` untuk logging yang bisa difilter (indexed).
- Solidity 105: fungsi `payable`/`receive`/`fallback` untuk menerima ETH dan `msg.value`; logika waktu memakai `block.timestamp` dan unit `seconds/minutes/hours/days/weeks`.

## Referensi
- Dokumentasi/materi workshop: https://tropical-dresser-957.notion.site/Base-Blockdev-Campus-Workshop-2ff86af6226680fdb4aec2958a7177f8
