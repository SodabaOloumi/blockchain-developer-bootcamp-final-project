// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

/// @title Identity Management In Healthcare
/// @author Sodaba Oloumi - <sodaba.ulomi@gmail.com>
/// Allows Medical Record System to maintain records of patients in their network.
/// Records can be accessed by doctor and patient .
/// A patient's record can be shared ,The doctor and the patient themselves can allow the third person to see the record.
/// The patient can send the amount of ether or fee to the doctor address


interface InterfacePatientRecords {

    /*
    * Public functions
    */
    ///  Allows to add a new patient in the network.
    function addPatient( address _address, string memory _fullName)external returns (bool) ;

    ///  Allows to add a new patient in the network.
    function addDoctor( address _address, string memory _fullName) external returns (bool);


    ///  Allows to add a patient record in the network.
   
    function addRecord(string memory _fullName,address _patientAddress , address _doctorAddress ,
  string memory _cc ,string memory _pi ,string memory _comment ,string memory _mh
   , uint256 _recordId) external;

   
    ///  Allows a doctor and patient and users who have permission to retrieve the record for a patient.
    function getRecord(address _address, uint256 _recordId) external view
      returns(string memory _fullName , address _doctorAddress,
      address _patientAddress, string memory _cc , string memory _pi  
      ,string memory _comment,string memory _mh);

    ///  Allows a doctor and patient to permission a user to view  the record for a patient.
    function grantPermission(address _patientAddress,address _viewner,
     uint256 _recordId ) external;
   ///  Allows a doctor and patient to revork permission of a user to view  the record for a patient.
    function revorkPermission (address _patientAddress,address _viewner, 
    uint256 _recordId)external;
   function recordOf(address _address) external view returns(uint256 _records );
   function ownerOfRecord(uint256 recordId)   external view returns(address _address);

}
