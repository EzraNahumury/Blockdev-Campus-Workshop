# Solidity_102

Kumpulan contoh dasar Solidity menggunakan Foundry. Repository ini mendemonstrasikan penggunaan `enum` dan `struct` serta interaksi kontrak via `forge` dan `cast`.

**Isi utama:**
- `src/LearnEnum.sol`
- `src/LearnStruct.sol`

## Prasyarat

- Foundry (forge, cast, anvil)
- Node lokal (Anvil) berjalan di `http://127.0.0.1:8545`

## Setup

```shell
forge init Solidity_102
cd Solidity_102
```

## LearnEnum

### Build

```shell
forge build
```

### Deploy

```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnEnum.sol:LearnEnum
```

Contoh hasil deploy:

```text
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0
Transaction hash: 0xb4b42b6a18e75e024f11cfcc1e4ecacdf035bfc08e90daf09ccbe2f7960318f0
```

### Interaksi

Baca status awal:

```shell
cast call 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0 \
  "currentStatus()(uint8)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:

```text
0
```

Panggil `register()`:

```shell
cast send 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0 \
  "register()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

Cek status lagi:

```shell
cast call 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0 \
  "currentStatus()(uint8)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:

```text
1
```

## LearnStruct

### Build

```shell
forge build
```

### Deploy

```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnStruct.sol:LearnStruct
```

Contoh hasil deploy:

```text
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0x9A676e781A523b5d0C0e43731313A708CB607508
Transaction hash: 0x01fb13824ac4331deedff4177fcdc8139e802b7c7d9da4f55f862ab4bc1f3261
```

### Interaksi

Baca data struct:

```shell
cast call 0x9A676e781A523b5d0C0e43731313A708CB607508 \
  "myStudent()(uint256,string,address,uint8,uint8,bool)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:

```text
2101001 [2.101e6]
"Budi Santoso"
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
1
0
true
```

Tambah credits:

```shell
cast send 0x9A676e781A523b5d0C0e43731313A708CB607508 \
  "addCredits()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

Cek data struct lagi:

```shell
cast call 0x9A676e781A523b5d0C0e43731313A708CB607508 \
  "myStudent()(uint256,string,address,uint8,uint8,bool)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:

```text
2101001 [2.101e6]
"Budi Santoso"
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
1
3
true
```

Ubah status:

```shell
cast send 0x9A676e781A523b5d0C0e43731313A708CB607508 \
  "changeStatus(uint8)" 3 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

Cek data struct setelah status berubah:

```shell
cast call 0x9A676e781A523b5d0C0e43731313A708CB607508 \
  "myStudent()(uint256,string,address,uint8,uint8,bool)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:

```text
2101001 [2.101e6]
"Budi Santoso"
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
3
3
true
```

## Catatan

- Private key di atas adalah default Anvil. Jangan gunakan di mainnet.
- Alamat kontrak di README ini adalah contoh hasil deploy pada lokal Anvil.
