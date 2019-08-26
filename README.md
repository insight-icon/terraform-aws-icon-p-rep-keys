# terraform-aws-icon-p-rep-keys

**WIP - Please be advised**

This module is segregated as best practices for handling sensitive information such as keys are being built into own 
module.  This will change as governance is improved. 

## Current State 

Currently the module has some logic that imports the key if you specify it or generates it via `ssh-keygen` via a 
`null_resource` and dumps it deep inside the `.terragrunt-cache`.  The logic needs to improve to support either 
importing the key locally based on specifying a variable or specifying an output location to generate the key to 
with a default inside the local configuration 



