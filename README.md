# Identity Management In Healthcare using blockchain technology
Blockchain comes with some properties including transparency, immutability, removal of intermediaries, and decentralization. These properties make it exceptional for creating a system is built that successfully can create, manage and disable patients data. 
Information can be share in a secure manner .
This system provides benefits to the medical staff as well as the patients due to transparency in how data is handle and secure.
Allows Medical Record System to maintain records of patients in their network. Records can be accessed by doctor and patient .
A patient's record can be shared ,The doctor and the patient themselves can allow the third person to see the record.

My motivation for writing this dapp is because I live in Afghanistan and my country is weak in terms of health system. The medical information is recorded in paper form. Every hospital has its own system. Usually  people of my country travel abroad for treatment . In this case,when  the patient  start their treatment inside the country and later continue the treatment abroad. 
It is difficult to keep a paper records and it's likely to get lost
Having a record of patient information in the treatment process can help . This system allows patients access their information anywhere, anytime.

##  Contract Workflow
1: Patient and doctor  will have to register themselves on the contract.

2: doctor can add patient records in contract .

3: patients can access theirs own records , they can  permission the  user to view thier record  and can  revorke permission.

4: when necessary, the doctor can share the patient`s file to another doctor.
5: You can get the number of records with the patient's address.
6: Can identify the record holder with the record ID.

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
- `truffle migrate --network development `
- In truffle-config.js file , Fill in the following below.
  - MNEMONIC=" your mnemonic here in quotes"
  - INFURA_URL=insert your infura url
  - `truffle migrate --network rinkeby`
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


