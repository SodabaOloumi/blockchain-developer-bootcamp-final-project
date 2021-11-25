<<<<<<< HEAD

# Security Measures

## Floating Pragma (SWC-103)
Specific compiler pragma `0.8.7` used in this contract to avoid accidential bugs

## Assert Violation(SWC-110) 
The require  used to check for conditions and throw an exception if the condition is not met.

## State Variable Default Visibility (SWC-108)

Variables specified as being public or private. Explicitly define visibility for all state variables.

## Authorization through tx.origin (SWC-115)
`tx.origin` should not be used for authorization. Use `msg.sender` instead.

## Use Modifiers Only for Validation
All modifiers in contract validate a condition with require keyword. Use modifiers to replace duplicate condition checks in multiple functions, such as isOwner(), otherwise use require  inside the function.
=======

# Security Measures

## Floating Pragma (SWC-103)
Specific compiler pragma `0.8.7` used in this contract to avoid accidential bugs

## Assert Violation(SWC-110) 
The require  used to check for conditions and throw an exception if the condition is not met.

## State Variable Default Visibility (SWC-108)

Variables specified as being public or private. Explicitly define visibility for all state variables.

## Authorization through tx.origin (SWC-115)
`tx.origin` should not be used for authorization. Use `msg.sender` instead.

## Use Modifiers Only for Validation
All modifiers in contract validate a condition with require keyword. Use modifiers to replace duplicate condition checks in multiple functions, such as isOwner(), otherwise use require  inside the function.
>>>>>>> 7206db154e4ca54d13ed42ade08ae3dd40cab1a8
