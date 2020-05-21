# terraform-sentinel-policies

## Description
This repository contains collections of policies. Policies are seperated by resource where possible or into a global/terraform specific folder. These folders are individually brought in as policy sets into TFE, allowing development or changes in one policy set to not effect another. 

Please review [documentation regarding the development of sentinel policies,](https://www.terraform.io/docs/cloud/sentinel/index.html) to understand usage. 

Individual Policies are documented in their .sentinel files.

## Usage

A "quick" overview can be [found here](https://www.hashicorp.com/resources/writing-and-testing-sentinel-policies-for-terraform). The development process for new policies follows the flow:

1. Create a .tf manifest that creates the resource that meets both the fail and success conditions you plan to test against.
2. Create a TFE Workspace using that repository and generate a sentinel mock from TFE's plan operation. 
3. A Mock bundle contains files related to the configuration, the plan operation, a run operation, and an existing state file
4. Generally you'll use the plan output to check against resources that will be created. The process often looks like: Lookup planned resources by type, iterate through resources detecting valdiation, returning validation boolean.  
5. Using a validation boolean and continueing to iterate through existing resources allows you to log all instances that violate the policy, reducing the mental effort on individuals resolving their manifests.
