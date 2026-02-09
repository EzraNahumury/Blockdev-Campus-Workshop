## solidity_105

Kumpulan latihan Foundry untuk kontrak:
- `LearnPayable.sol`
- `LearnSendETH.sol`
- `LearnTime.sol`

Semua contoh di bawah memakai Anvil lokal di `http://127.0.0.1:8545` dan private key default Anvil:
`0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`

### Prasyarat

```shell
anvil
```

### Build

```shell
forge build
```

## LearnPayable.sol

### Deploy

```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnPayable.sol:LearnPayable
```

### Interaksi

```shell
cast send 0x998abeb3E57409262aE5b751f60747921B33613E \
  "registerStudent()(uint256)" \
  --value 1000000000000000 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send 0x998abeb3E57409262aE5b751f60747921B33613E \
  "registerStudent()(uint256)" \
  --value 1000000000000000 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x998abeb3E57409262aE5b751f60747921B33613E \
  "getBalance()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:
- `getBalance()` -> `2000000000000000` (2e15 wei)

## LearnSendETH.sol

### Deploy

```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnSendETH.sol:LearnSendETH
```

### Interaksi

```shell
cast send 0x99bbA657f2BbC93c02D617f8bA121cB8Fc104Acf \
  "deposit()" \
  --value 10000000000000000 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send 0x99bbA657f2BbC93c02D617f8bA121cB8Fc104Acf \
  "deposit()" \
  --value 10000000000000000 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send 0x99bbA657f2BbC93c02D617f8bA121cB8Fc104Acf \
  "sendScholarship(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1000000000000000 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x99bbA657f2BbC93c02D617f8bA121cB8Fc104Acf \
  "scholarships(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:
- `scholarships(0x7099...)` -> `1000000000000000` (1e15 wei)

## LearnTime.sol

### Deploy

```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnTime.sol:LearnTime
```

### Interaksi

```shell
cast send 0x5eb3Bc0a489C5A8288765d2336659EbCA68FCd00 \
  "registerStudent(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x5eb3Bc0a489C5A8288765d2336659EbCA68FCd00 \
  "getStudentAge(uint256)(uint256)" 2101001 \
  --rpc-url http://127.0.0.1:8545

cast send 0x5eb3Bc0a489C5A8288765d2336659EbCA68FCd00 \
  "submitAssignment(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call 0x5eb3Bc0a489C5A8288765d2336659EbCA68FCd00 \
  "submitAssignment(uint256)" 2101001 \
  --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 \
  --rpc-url http://127.0.0.1:8545

cast call 0x5eb3Bc0a489C5A8288765d2336659EbCA68FCd00 \
  "timeUntilNextSubmission(uint256)(uint256)" 2101001 \
  --rpc-url http://127.0.0.1:8545
```

Contoh output:
- `getStudentAge(2101001)` -> `0`
- `submitAssignment(2101001)` (call) -> revert `Harus tunggu 1 hari`
- `timeUntilNextSubmission(2101001)` -> `86400`

## Catatan

Alamat kontrak dan hasil di atas berasal dari deploy lokal Anvil. Jika Anda restart Anvil atau deploy ulang, alamat kontrak dan hash transaksi akan berubah.
