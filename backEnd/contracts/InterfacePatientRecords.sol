// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

/// @title Identity Management In Healthcare
/// @author Sodaba Oloumi - <sodaba.ulomi@gmail.com>
/// Allows Medical Record System to maintain records of patients in their network.
/// Records can be accessed by doctor and patient .
/// A patient's record can be shared ,The doctor and the patient themselves can allow the third person to see the record.
/// The patient can send the amount of ether or fee to the doctor address


interface InterfacePatientRecords {

    /// @dev Fallback function allows to deposit ether.
  //  Fallback() public payable ;
 
   

    /*
    * Public functions
    */
    ///  Allows to add a new patient in the network.
    function addPatient( address _address, string memory _fullName)external returns (bool) ;

    ///  Allows to add a new patient in the network.
    function addDoctor( address _address, string memory _fullName) external returns (bool);


    ///  Allows to add a patient record in the network.
   
    function addRecord(string memory _fullName,address _patientAddress , address _doctorAddress ,
  string memory _cc ,string memory _pi ,string memory _comment ,string memory _mh,
  string memory _recordName) external;

   
    ///  Allows a doctor and patient and users who have permission to retrieve the record for a patient.
    function getRecord(address _address, string memory _recordName) external view
      returns(string memory _fullName , address _doctorAddress,
      address _patientAddress, string memory _cc , string memory _pi  
      ,string memory _comment,string memory _mh);

    ///  Allows a doctor and patient to permission a user to view  the record for a patient.
    function grantPermission(address _patientAddress,address _viewner,
     string memory _recordName  ) external;
   ///  Allows a doctor and patient to revork permission of a user to view  the record for a patient.
    function revorkPermission (address _patientAddress,address _viewner, 
    string memory _recordName)external;
  
    ///  gets the balance of patient.
    
    // function getPatientBalance(address _patientAddress) external  returns (uint256);

   
    // /// @dev pays a patient for providing their name.
    // /// @param _patientAddress to receive tokens.
    // function payPatient(address _patientAddress) external;

}
