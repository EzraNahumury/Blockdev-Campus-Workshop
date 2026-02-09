**Hello Foundry**
Repository latihan Foundry + Solidity sederhana (tipe data dan operasi dasar).

**Environment**
- Foundry `1.5.1-stable` (Commit `b0a9dd9ceda36f63e2326ce530c10e6916f4b8a2`)
- Solc `0.8.33`
- RPC lokal Anvil `http://127.0.0.1:8545`

**Prereqs**
- Foundry terpasang dan `anvil` berjalan di `http://127.0.0.1:8545`
- Default private key Anvil untuk contoh: `0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`

**Build**
```shell
forge build
```

**Contracts**
`src/LearnString.sol`
```shell
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnString.sol:LearnString
```
```text
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "studentName()(string)" \
  --rpc-url http://127.0.0.1:8545
```
```text
"Ez"
```
```shell
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "changeName(string)" "Ezra" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "studentName()(string)" \
  --rpc-url http://127.0.0.1:8545
```
```text
"Ezra"
```

`src/LearnNumber.sol`
```shell
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnNumber.sol:LearnNumber
```
```text
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "studentId()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
2101001
```
```shell
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "changeStudentId(uint256)" 123 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "studentId()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
123
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "credits()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0
```
```shell
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "addCredits()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "credits()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
3
```

`src/LearnBoolean.sol`
```shell
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnBoolean.sol:LearnBoolean
```
```text
Deployed to: 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9
```
```shell
cast call 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "isActive()(bool)" \
  --rpc-url http://127.0.0.1:8545
```
```text
true
```
```shell
cast send 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "changeStatus(bool)" false \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "isActive()(bool)" \
  --rpc-url http://127.0.0.1:8545
```
```text
false
```
```shell
cast call 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "hasGraduated()(bool)" \
  --rpc-url http://127.0.0.1:8545
```
```text
false
```
```shell
cast send 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "graduate()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 \
  "hasGraduated()(bool)" \
  --rpc-url http://127.0.0.1:8545
```
```text
true
```

`src/LearnAddress.sol`
```shell
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/LearnAddress.sol:LearnAddress
```
```text
Deployed to: 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6
```
```shell
cast call 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6 \
  "admin()(address)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```
```shell
cast call 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6 \
  "student()(address)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0x0000000000000000000000000000000000000000
```
```shell
cast send 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6 \
  "setStudent(address)" 0x537b9BCc6a1fBa7530805a8F5A573735d11cBcEf \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6 \
  "student()(address)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0x537b9BCc6a1fBa7530805a8F5A573735d11cBcEf
```

`src/StudentData.sol`
```shell
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --broadcast \
  src/StudentData.sol:StudentData
```
```text
Deployed to: 0x610178dA211FEF7D417bC0e6FeD39F05609AD788
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "studentName()(string)" \
  --rpc-url http://127.0.0.1:8545
```
```text
"Budi Santoso"
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "studentId()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
2101001
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "isActive()(bool)" \
  --rpc-url http://127.0.0.1:8545
```
```text
true
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "registeredTime()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
1770630389
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "credits()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "getAge()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
0
```
```shell
cast send 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "updateCredits()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "credits()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
3
```
```shell
cast call 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 \
  "getAge()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```
```text
379
```

**Notes**
- Output dan address di atas berasal dari run lokal Anvil, jadi akan berbeda jika chain di-reset.
- `studentId()` itu lowercase, pemanggilan `StudentId()` atau `studenId()` akan revert.
- `LearnNumber.sol` sempat memunculkan warning pragma. Tambahkan `pragma solidity ^0.8.33;` jika ingin menghilangkan warning.
