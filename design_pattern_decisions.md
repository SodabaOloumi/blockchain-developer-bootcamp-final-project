# Design Patterns and security considerations:
## Design patters:
### Inheritance and Interfaces
-Healt Contract is inheriting EnumerableMap and EnumerableSet library, and using the InterfacePatientRecords.
### Access Control Design Patterns
- Restricting access to certain functions, like addRecord function with isDoctor(_doctorAddress) ,
  verifyCaller(_doctorAddress) and recordExist(_recordName ,_patientAddress) modifiers.