## Project 1 for Udacity DevOps Nano Degree program

<a href="https://azure.microsoft.com/en-us/">
    <img src=".github/azure_logo.png" alt="Azure logo" title="Azure" align="left" height="50" />
</a>

<a href="https://terraform.io">
    <img src=".github/tf_logo.png" alt="Terraform logo" title="Terraform" align="left" height="50" />
</a>
# by

####################################################################################################
####################################################################################################

Sadiq Adewale ADEDAYO

July 27, 2022

####################################################################################################
####################################################################################################
####################################################################################################

Introduction
in this project, we aim to deloy resources on Azure using Terraform and Packer. The resources is expected to have a policy,
the image to be used for the virtual machine will be created with the help of Packer.
Objectives

- Create a server image (template) with Packer
- Create a terraform template for deploying a scalable cluster of servers ensuring that;
    1) a load balancer is used to manage incoming traffics
    2) the infrastructure is adequately secured by adhering to the secure practices
- Deploy the infrasctructure
- Create documentation in the form of a README

Dependencies

- Azure CLI
- Terraform
- Packer

-

What to expect
After running the commands adequeately with the dependent files provided, you would be able to

- create an image with Packer using packer_template.json
- create a policy with the policy_template.json
- create a resource group with Terraform using both the variables.tf and main.tf

To do

- login to azure portal from CLI, and run the following
<packer build>
<terraform plan -out solution.plan>
To destroy infrastructure when finished and not required anymore, Please run <terraform destroy>

Conclusions
