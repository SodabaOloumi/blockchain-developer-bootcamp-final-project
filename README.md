# Identity Management In Healthcare using blockchain technology
Blockchain comes with some properties including transparency, immutability, removal of intermediaries, and decentralization. These properties make it exceptional for creating a system is built that successfully can create, manage and disable patients data. 
Information can be share in a secure manner .
This system provides benefits to the medical staff as well as the patients due to transparency in how data is handle and secure.

##  Contract Workflow
1: Patient and doctor  will have to register themselves on the contract.

2: doctor can add patient records in contract .

3: patients can access theirs own records , they can  permission the  user to view thier record  and can  revorke permission.

4: when necessary, the doctor can share the patient`s file to another doctor.

## How to run this project locally:

### Prerequisites
- Node.js >= v14
- Truffle and Ganache
- npm
### Contracts
- Clone code 
 ``
git clone https://github.com/SodabaOloumi/blockchain-developer-bootcamp-final-project.git
``
- Run `npm install` in backEnd root to install Truffle build and smart contract dependencies
- Run local testnet in port `7545` with an Ethereum client, e.g. Ganache
- `truffle migrate --network development --reset`
- In truffle-config.js file , Fill in the following below.
  - MNEMONIC=" your mnemonic here in quotes"
  - INFURA_URL=insert your infura url
  - `truffle migrate --network -rinkeby`
- Run tests in /blockchain-developer-bootcamp-final-project/backEnd$ directory `truffle test`

### Frontend
- `cd vapp`
- `npm install`
- `npm run serve`
- Open `http://localhost:8080` 

## structure
- `vapp`: Project's Vue frontend.
- `backEnd` : this folder includs contracts folder , test folder , build folder and migrations folder. 
- `contracts`:  In this folder, the InterfacePatientRecords.sol interface is a contract that guarantees to a client how a class or struct will behave.
   And contract Healt.sol is the main contract. Implements the InterfacePatientRecords.sol interface, implements all InterfacePatientRecords.sol interface methods.
- `test` : this is where the tests are stored. The test is written in truffle. The purpose and expected outcome of each test is explained in the code. 
 to run the test
`
truffle test
`
- `build`: When compile the contract this folder created , its save **data/abi** .
- `migrations`: Migration files for deploying contracts in `contracts` directory.


