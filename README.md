# terraform-aws-icon-p-rep-keys

**WIP - Please be advised**

This module is segregated as best practices for handling sensitive information such as keys are being built into own module.  This will change as governance is improved. 

## Current State 

Currently the module has some logic that imports the key if you specify it or generates it via `ssh-keygen` via a `null_resource` and dumps it deep inside the `.terragrunt-cache`.  The logic needs to improve to support either importing the key locally based on specifying a variable or specifying an output location to generate the key to with a default inside the local configuration 

**Resources can't be created outside the current directory so key generation is not an option unless that key is generated only 

## Future State 

We need the following functionality: 

- Import local key if supplied path 
- Get reference to key if the name is supplied 
- Import key into vault if that `vault_public_key` is supplied 
    - Use vault provider and [this resource](https://www.terraform.io/docs/providers/vault/r/ssh_secret_backend_ca.html)
    - Get key reference if key already exists 
        - Validate logic 
