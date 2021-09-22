# TERRAFORM-OCI-RSA-BASTION
This Terraform stack deploys a bastion host to an Oracle Cloud Infrastructure enviroment. 
The stack uses the following OCI resources:
- Compute
- Networking

An existing vcn is required to deploy the stack.

The stack is intended to be used in conjunction with the following ansible playbooks.
- [oci-rsa-ansible-bastion](PLACEHOLDER)

If this playbook is not appropriately provided the stack will only provision the instances and not install the security and monitoring tools. Using the playbook allows for otp access to the bastion and automatic Wazuh agent registration.

## Requirements
- [Terraform]() >= 1.0.6

## Architecture
### Compute
Creates a bastion host which uses an Oracle Autonomous Linux image.

### Networking
The Terraform stack provisions a subnet with a security lists.

## Branches
* `main` branch contains the latest code.

## Prerequisites
Before you can run terraform, the required ansible playbooks should be bundled up with the dependancies and uploaded to 
an object storage bucket.

For each of the ansible playbooks, run the following commands.

Assuming you have cloned the repository and are in the repository root:

Command to install the ansible roles
```
ansible-galaxy install -r requirements.yml -p ./roles
```
Command to bundle up the playbook.
Here the `playbook_zip` is `target_dir/playbook_name`
```
tar -czf $playbook_zip $playbook_name
```
Command to upload the tar file to object storage
```
oci os object put -ns $namespace -bn $bucketname --file $playbook_zip --name ${playbook_name}.tgz
```
After Terraform provisions the instance, the bootstrapping script pulls the appropriate tar file from object store and runs the playbook.

## Usage
If the bootstrapping variables are not set, Terraform will only provision the resources and not install the security tools, otp access, wazuh agent. 

### Bootstrapping Variables
Define the following variables in order to deploy the Ansible playbooks during bootstrapping. The default value of these variables is `UNDEFINED`.

- `bootstrap_bucket`: Object storage bucket containing all the Ansible playbooks. For example `my_bootstrap_bucket`
- `bastion_bootstrap_bundle`:  The tgz containing the Ansible playbook for bastion. For example `oci-rsa-ansible-bastion.tgz`

### Terraform Variables
Terraform variables used in this stack are referenced [here](VARIABLES.md). This document is automatically generated 
using the [terraform-docs](https://github.com/terraform-docs/terraform-docs) with the following command:

```
terraform-docs markdown table .
```

### Running Terraform
After specifying the required variables you can run the stack using
```
terraform init
terraform plan
terraform apply
```

### Setting Up OTP Access
In order to log into the Bastion the first time, you will need your private SSH key (public key should have been provided as an input for Terraform). With that, you'll be prompted for a "One-time password (OATH) for opc" - the default value is: `560000`

Immediately scan the barcode using your authenticator of choice, or you will lose access to this host. If you can't log in, you will have to terminate the bastion and recreate it via Terraform.

## The Team
This repository was developed by the Oracle OCI Regulatory Solutions and Automation (RSA) team. 

## How to Contribute
Interested in contributing?  See our contribution [guidelines](CONTRIBUTE.md) for details.

## License
This repository and its contents are licensed under [UPL 1.0](https://opensource.org/licenses/UPL).