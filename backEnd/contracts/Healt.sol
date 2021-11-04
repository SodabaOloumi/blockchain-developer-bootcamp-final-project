// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

contract Healt {
 //  variables
  address public owner = msg.sender;
  uint userCount;
  

// enum
  enum State{
      Patient,
      Doctor
  }
  // struct
  struct User{
      string fullName;
      State state;
      address userAddress;
  }
   struct Record{
        string fullName;
        address patientAddress;
        address doctorAddress;
        string cc;
        string pi;
        string comment;
        string mh;
        string recordName;
    }
    
    // mapping
  mapping (address => User)public user;
  
  mapping (string => mapping (address => Record))private record;
  
  // Mapping from record name to approved address
  mapping (string => mapping (address => bool)) public viewRecord;
    
  
  
  /* 
   * Events
   */
   event userAddition(address user);
   event PatientRecordAdded(string recordName, address patientAddress);
   event Approval(address indexed owner, address indexed viewer, string recordName);

  
constructor(){
    owner = msg.sender;
    userCount =0;
    
}

  /* 
   * Modifiers
   */

   modifier isOwner () { 
    require (owner == msg.sender,'"Caller is not owner"' ); 
    _;
  }

  modifier verifyCaller (address _address) { 
    require (msg.sender == _address); 
    _;
  }

   modifier isDoctor(address _address){
       
       require(user[_address].state == State.Doctor,"User is not doctor");
       _;
   }
   modifier isPatient(address _address){
        
       require(user[_address].state == State.Patient,"User is not patient");
       _;
   } 

 
      //functions
  function addPatient( address _address, string memory _fullName) public returns (bool) {
   
    user[_address] = User({
     fullName: _fullName, 
     state: State.Patient, 
     userAddress: _address
    });
   
   emit userAddition(_address);
    return true;
  }
  function addDoctor( address _address, string memory _fullName) public returns (bool) {
   
    user[_address] = User({
     fullName: _fullName, 
     state: State.Doctor, 
     userAddress: _address
    });
   
   userCount = userCount + 1;
   emit userAddition(_address);
    return true;
  }
 
 // 
 // modifiers to ckeck the user is doctor  
 // and check the user calling this function is the doctor
  function addRecord(string memory _fullName,address _patientAddress , address _doctorAddress ,
  string memory _cc ,string memory _pi ,string memory _comment ,string memory _mh,
  string memory _recordName) public isDoctor(_doctorAddress) verifyCaller(_doctorAddress){
     
      require(user[_doctorAddress].userAddress != address(0), "The doctorAddress is not nothing ,first create a address");
      require(user[_patientAddress].userAddress != address(0), "The patientAddress is not nothing ,first create a address");
      
      Record memory newRecord = Record( _fullName,_patientAddress,
      
      _doctorAddress,_cc,_pi,_comment , _mh , _recordName );
         record[_recordName][_patientAddress]=newRecord;
         
      emit PatientRecordAdded(_recordName, _patientAddress);
  }
  // getRecord
//   function getRecord( string memory _recordName)
//   view public isPatient(msg.sender)
//   returns(string memory _fullName , address _doctorAddress,address _patientAddress,
//   string memory _cc , string memory _pi  ,string memory _comment,string memory _mh)
  
//  {
 
//       Record memory s =record[_recordName][msg.sender];
       
//         return(s.fullName,s.patientAddress, s.doctorAddress,s.cc,s.pi,s.comment,s.mh);
//   }
  // ViewPatientRecord
  function getRecord(address _address,
  string memory _recordName)view public
  returns(string memory _fullName , address _doctorAddress,address _patientAddress,
  string memory _cc , string memory _pi  ,string memory _comment,string memory _mh)
  {
      
       require(record[_recordName][_address].patientAddress == _address 
      ," record is nothing");
      
      // in 3 state we can get record 1: the patient is the owner of the record 
      // 2: be doctor an add record 3: have Permission for get record.
      ((record[_recordName][_address].patientAddress == msg.sender )||(record[_recordName][_address].doctorAddress == msg.sender)||
      (viewRecord[_recordName][msg.sender] == true)," the doctor and the user have pemission can view ");
      
      // return the record of patient
       Record memory s =record[_recordName][_address];
       
        return(s.fullName,s.patientAddress, s.doctorAddress,s.cc,s.pi,s.comment,s.mh);
  }
  
  // grantPermission
  
  function grantPermission(address _patientAddress,address _viewner, string memory _recordName  )
  public 
   {
       
       // check the viewner is accsesed 
       require(user[_viewner].userAddress != address(0));
       
       // the person calling this function is the patient or doctor ( just is the owner of the record
       // or doctor can grant permission)
    
       require(( msg.sender == record[_recordName][_patientAddress].patientAddress)||
       (msg.sender ==record[_recordName][_patientAddress].doctorAddress)
       ,"Only patient and doctor can give permission");
       
       require(viewRecord[_recordName][_viewner] == false, "Already has viewing rights!!");
       
        viewRecord[_recordName][_viewner]= true;
        
        emit Approval(msg.sender, _viewner, _recordName);
        
    }
    
    //revorkPermission 
  
  function revorkPermission (address _patientAddress,address _viewner, 
  string memory _recordName) public{
       
       require(( msg.sender == record[_recordName][_patientAddress].patientAddress)||
       (msg.sender ==record[_recordName][_patientAddress].doctorAddress)
       ,"Only patient and doctor can revork permission");
       require(viewRecord[_recordName][_viewner] == true, "No need to revoke!!");
       
      viewRecord[_recordName][_viewner]= false;
  }   

    
}
