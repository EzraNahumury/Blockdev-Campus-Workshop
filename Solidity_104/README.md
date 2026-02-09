# solidity_104

**Ringkasan**
Repositori latihan Foundry untuk kontrak Solidity: `LearnRequire`, `LearnModifier`, dan `LearnEvents`. Contoh di bawah dirapikan dari sesi build, deploy, dan interaksi menggunakan `forge`, `anvil`, dan `cast`.

**Struktur**
- `src/LearnRequire.sol` demo `require` dan mapping owner/kredit.
- `src/LearnModifier.sol` demo `modifier` untuk admin dan owner student.
- `src/LearnEvents.sol` demo `event` saat registrasi student.

**Prasyarat**
- Foundry terpasang dan tersedia di PATH.
- Jalankan perintah dari direktori proyek: `c:\Base\solidity_104`.

**Build**
```shell
forge build
```

**Menjalankan Anvil**
```shell
anvil
```
Jika muncul `Address already in use`, hentikan proses Anvil lain atau gunakan port lain, contoh:
```shell
anvil --port 8546
```

**Konfigurasi Lokal (Anvil)**
Contoh di bawah memakai private key default Anvil. Ini aman untuk lokal, jangan gunakan di jaringan publik.
```text
RPC     : http://127.0.0.1:8545
PK      : 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

**LearnRequire**
Deploy:
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnRequire.sol:LearnRequire
```
Contoh hasil deploy:
```text
Deployed to: 0x67d269191c92Caf3cD7723F116c85e6E9bf55933
```
Registrasi student dan cek owner:
```shell
cast send 0x67d269191c92Caf3cD7723F116c85e6E9bf55933 \
  "registerStudent(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x67d269191c92Caf3cD7723F116c85e6E9bf55933 \
  "studentOwner(uint256)(address)" 2101001 \
  --rpc-url http://127.0.0.1:8545
```
Tambah kredit dan cek saldo:
```shell
cast send 0x67d269191c92Caf3cD7723F116c85e6E9bf55933 \
  "addCredits(uint256,uint256)" 2101001 3 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x67d269191c92Caf3cD7723F116c85e6E9bf55933 \
  "studentCredits(uint256)(uint256)" 2101001 \
  --rpc-url http://127.0.0.1:8545
```

**LearnModifier**
Deploy:
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnModifier.sol:LearnModifier
```
Contoh hasil deploy:
```text
Deployed to: 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB
```
Cek admin dan counter:
```shell
cast call 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "admin()(address)" \
  --rpc-url http://127.0.0.1:8545

cast call 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "adminActionCount()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
Panggil fungsi admin:
```shell
cast send 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "adminFunction()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
Contoh akses non-admin yang gagal:
```shell
cast call 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "adminFunction()" \
  --from 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 \
  --rpc-url http://127.0.0.1:8545
```
Registrasi student dan cek owner:
```shell
cast send 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "registerStudent(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
  "studentOwner(uint256)(address)" 2101001 \
  --rpc-url http://127.0.0.1:8545
```

**LearnEvents**
Deploy:
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnEvents.sol:LearnEvents
```
Contoh hasil deploy:
```text
Deployed to: 0x1613beB3B2C4f22Ee086B2b38C1476A3cE7f78E8
```
Registrasi student (emit event):
```shell
cast send 0x1613beB3B2C4f22Ee086B2b38C1476A3cE7f78E8 \
  "registerStudent(string)" "Budi" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

**Catatan**
- Alamat kontrak dan hash transaksi akan berbeda tiap deploy. Gunakan output `forge create` untuk alamat terbaru.
- Jika `forge build` memberi lint `unwrapped-modifier-logic`, itu hanya saran optimasi, bukan error.
