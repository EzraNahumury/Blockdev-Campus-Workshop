# Solidity_103

Project latihan Foundry untuk kontrak mapping, array, dan struct.

**Stack**
Foundry (Forge, Cast, Anvil).

**Prasyarat**
Foundry sudah terpasang.
Node lokal Anvil berjalan di `http://127.0.0.1:8545`.

**Struktur**
`src/LearnMapping.sol` latihan mapping NIM ke data mahasiswa.
`src/LearnArray.sol` latihan array NIM.
`src/MultipleStudents.sol` latihan struct dan counter.

**Quick Start**
```shell
anvil
forge build
```

**LearnMapping**
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnMapping.sol:LearnMapping

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256,string)" 2101001 "Budi Santoso" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "studentName(uint256)(string)" 2101001 \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "studentCredits(uint256)(uint256)" 2101001 \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256,string)" 2101002 "Ani" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "studentName(uint256)(string)" 2101002 \
  --rpc-url http://127.0.0.1:8545
```

Contoh hasil (Anvil lokal):
Deploy LearnMapping ke `0x9A9f2CCfdE556A7E9Ff0848998Aa4a0CFD8863AE`.
`studentName(2101001)` menghasilkan `"Budi Santoso"`.
`studentCredits(2101001)` menghasilkan `0`.
`studentName(2101002)` menghasilkan `"Ani"`.

**LearnArray**
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnArray.sol:LearnArray

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256)" 2101001 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256)" 2101003 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addStudent(uint256)" 2101003 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "getTotalStudents()(uint256)" \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "getAllStudents()(uint256[])" \
  --rpc-url http://127.0.0.1:8545
```

Contoh hasil (Anvil lokal):
Deploy LearnArray ke `0xc6e7DF5E7b4f2A278906862b61205850344D4e7d`.
`getTotalStudents()` menghasilkan `4`.
`getAllStudents()` menghasilkan `[2101001, 2101001, 2101003, 2101003]`.

**MultipleStudents**
```shell
forge create \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/MultipleStudents.sol:MultipleStudents

cast send <DEPLOYED_ADDRESS> \
  "addStudent(string)" "Budi" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addStudent(string)" "Budi" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545

cast call <DEPLOYED_ADDRESS> \
  "studentCounter()(uint256)" \
  --rpc-url http://127.0.0.1:8545

cast send <DEPLOYED_ADDRESS> \
  "addCredits(uint256,uint8)" 1 6 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

Contoh hasil (Anvil lokal):
Deploy MultipleStudents ke `0x4A679253410272dd5232B3Ff7cF5dbB88f295319`.
`studentCounter()` menghasilkan `2`.
Pemanggilan `getStudent(uint256)(uint256,string,address,uint8,uint8,bool)` gagal decode, kemungkinan tipe return ABI tidak sesuai dengan signature fungsi di kontrak.

**Referensi**
Dokumentasi Foundry: `https://book.getfoundry.sh/`
