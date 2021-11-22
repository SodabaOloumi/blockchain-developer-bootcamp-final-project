// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;
/// @title Identity Management In Healthcare
/// @author Sodaba Oloumi - <sodaba.ulomi@gmail.com>
/// Allows Medical Record System to maintain records of patients in their network.
/// Records can be accessed by doctor and patient .
/// A patient's record can be shared ,The doctor and the patient themselves can allow the third person to see the record.
/// The patient can send the amount of ether or fee to the doctor address

import "./InterfacePatientRecords.sol";


contract Healt is InterfacePatientRecords  {
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
   /// @notice Emitted when a user is registred 
  /// @param user User address
   event userAddition(address user);
   
    /// @notice Emitted when the doctor added a record to the patient's address
  /// @param recordName record name string
  /// @param patientAddress patient address 
   event PatientRecordAdded(string recordName, address patientAddress);
   
   
    /// @notice Emitted when the doctor or patient permission the user to view patient's record
  /// @param owner Owner address 
  /// @param viewer Viewer address 
  /// @param recordName record name string
   event Approval(address indexed owner, address indexed viewer, string recordName);
   
   
    /// @notice Emitted when the doctor or patient revork permission the user to view patient's record
  /// @param owner Owner address 
  /// @param viewer Viewer address 
  /// @param recordName record name string
   event unApproval(address indexed owner, address indexed viewer, string recordName);

  

constructor() {
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

 
    ///public functions
    
     /// The addPatient function registred the new patient user
  function addPatient( address _patientAddress, string memory _fullName) public override returns (bool) {
         // A user can only register once
         require(user[_patientAddress].userAddress == address(0),"Already exist");
    user[_patientAddress] = User({
     fullName: _fullName, 
     state: State.Patient, 
     userAddress: _patientAddress
    });
   
   emit userAddition(_patientAddress);
    return true;
  }
  /// The addDoctor function registred the new doctor user
  function addDoctor( address _doctorAddress, string memory _fullName) public override returns (bool) {
    // A user can only register once
    require(user[_doctorAddress].userAddress == address(0),"Already exist");
    user[_doctorAddress] = User({
     fullName: _fullName, 
     state: State.Doctor, 
     userAddress: _doctorAddress
    });
   
   userCount = userCount + 1;
   emit userAddition(_doctorAddress);
    return true;
  }
  /// Allows to add a patient record in the network.
  // Only a doctor can add record
 /// modifiers to ckeck the user is doctor  
 // and check the user calling this function is the doctor
  function addRecord(string memory _fullName,address _patientAddress , address _doctorAddress ,
  string memory _cc ,string memory _pi ,string memory _comment ,string memory _mh,
  string memory _recordName) public override isDoctor(_doctorAddress) verifyCaller(_doctorAddress){
     
      require(user[_doctorAddress].userAddress != address(0), "The doctorAddress is not nothing ,first create a address");
      require(user[_patientAddress].userAddress != address(0), "The patientAddress is not nothing ,first create a address");
      
      Record memory newRecord = Record( _fullName,_patientAddress,
      
      _doctorAddress,_cc,_pi,_comment , _mh , _recordName );
         record[_recordName][_patientAddress]=newRecord;
         
      emit PatientRecordAdded(_recordName, _patientAddress);
  }
  // getRecord

  function getRecord(address _address,
  string memory _recordName)view public override
  returns(string memory _fullName , address _doctorAddress,address _patientAddress,
  string memory _cc , string memory _pi  ,string memory _comment,string memory _mh)
  {
      
       require(record[_recordName][_address].patientAddress == _address 
      ," record is nothing");
      
      // in 3 state we can get record 1: the patient 
      // 2: the doctor 3:  user who have Permission for view record.
      ((record[_recordName][_address].patientAddress == msg.sender )||(record[_recordName][_address].doctorAddress == msg.sender)||
      (viewRecord[_recordName][msg.sender] == true)," the doctor and the user have pemission can view ");
      
      // return the record of patient
       Record memory s =record[_recordName][_address];
       
        return(s.fullName,s.patientAddress, s.doctorAddress,s.cc,s.pi,s.comment,s.mh);
  }
  
  // doctor or  patient grand  permission the user to view the record 
  function grantPermission(address _patientAddress,address _viewner, string memory _recordName  )
  public override
   {
       
       // check the viewner is accsesed 
       require(user[_viewner].userAddress != address(0),"Viewner not registered");
       //
       require(user[_viewner].state == State.Doctor,"Viewner should be a doctor");
       
       // the person calling this function should be the patient or doctor 
    
       require(( msg.sender == record[_recordName][_patientAddress].patientAddress)||
       (msg.sender ==record[_recordName][_patientAddress].doctorAddress)
       ,"Only patient and doctor can give permission");
       
       require(viewRecord[_recordName][_viewner] == false, "Already has viewing rights!!");
       
        viewRecord[_recordName][_viewner]= true;
        
        emit Approval(msg.sender, _viewner, _recordName);
        
    }
    
    // doctor or  patient grand  permission the user to view the record 
  
  function revorkPermission (address _patientAddress,address _viewner, 
  string memory _recordName) public override{
       
       require(( msg.sender == record[_recordName][_patientAddress].patientAddress)||
       (msg.sender ==record[_recordName][_patientAddress].doctorAddress)
       ,"Only patient and doctor can revork permission");
       require(viewRecord[_recordName][_viewner] == true, "No need to revoke!!");
       
      viewRecord[_recordName][_viewner]= false;
      emit unApproval(msg.sender, _viewner, _recordName);
  }
//   function getPatientBalance(address _patientAddress) public view override returns (uint256){
//       return balanceOf(_patientAddress);
//   }

    
}
