
# Contract Security Measures
This is a list of some security measurements used in this contract

## Floating Pragma (SWC-103)
Specific compiler pragma `0.8.7` used in this contract to avoid accidential bugs

## Assert Violation(SWC-110) 
The assert and require  used to check for conditions and throw an exception if the condition is not met.


## Modifiers
All modifiers in contract validate a condition with require keyword.Used modifiers to replace duplicate condition checks in multiple functions, such as isOwner(), otherwise used require  inside the function.
