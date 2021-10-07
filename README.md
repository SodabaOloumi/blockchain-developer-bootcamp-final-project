# Identity Management In Healthcare using blockchain technology
Blockchain comes with some properties including transparency, immutability, removal of intermediaries, and decentralization. These properties make it exceptional for creating a system is built that successfully can create, manage and disable patients data. 
Information can be share in a secure manner and interoperability eases organization into adopting this system.
This system provides benefits to the medical staff as well as the patients due to transparency in how data is handle and secure.
# Identity Management In Healthcare Contract Workflow
1: Patient and doctor  will have to register themselves somehow on the contract.
2: doctor can add patient records in contract .
3: patients can access theirs own records and have allows to share their own records.
4: when necessary, the doctor can share the patient`s file to another doctor.
# Pseudocode 
1: Func registerDoctor(address _ doctorAddress)
* Doctor address add in to mapping 


2:Func registerPatient(address _patientAddress)
*	Patient address add in to a mapping


3: Func addPatientInfo(string memory _firstName , string memory _lastName ,address _doctorAddress,address _patientAddress, string memory _doctorName , uint256 _admissionDate  ,uint256 _dischargeDate, uint256 _age, string memory _job, uint256 _phoneNumber)
*	Add to patient characteristics in to mapping.


4:Func addRecord(string memory _fullName , address _doctorAddress,address _patientAddress, string memory _cc , string memory _pi  ,string memory _comment, string memory _mh, string memory _recordName)
*	Check the patient address and doctor address not be zero
*	Only doctor can add record
*	Add record in to mapping


5: Func getRecord(address _ownerAddress , string memory _recordName) 
*	if _ownerAddress == doctorAddress || patientAddress
*	return _fullName , _doctorAddress _patientAddress, _cc , _pi  , _comment,_mh


6: Func giveViewPermission(address viewer)
*	check ms.sender to be ownerPatient or ownerDoctor
*	canView[viewer] = true;

7:Func revokeViewPermission(address viewer)
*	check ms.sender to be ownerPatient or ownerDoctor
*	canView[viewer] =false;



