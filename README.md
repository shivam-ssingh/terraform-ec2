
# Terraform EC2 Instance Provisioning with GitHub Actions  

This repository contains Terraform scripts to provision and destroy an AWS EC2 instance. The instance is configured to allow traffic on:  
- **Port 22:** For SSH access.  
- **Port 5100:** To expose a Docker application.  

The project uses an **S3 backend** to store the Terraform state securely and employs **GitHub Actions** for automated provisioning and destruction of the EC2 instance. 

---

## **Features**

1. **EC2 Instance Configuration:**
   - Provisions an EC2 instance with security group rules allowing traffic on ports **22** and **5100**.
   - Uses variables for flexible configurations like instance type, AMI, and key pair.

2. **S3 Backend:**
   - Stores the Terraform state file in an encrypted S3 bucket for team collaboration and state persistence.

3. **GitHub Actions Integration:**
   - Automates Terraform workflows:
     - `provision.yml`: Creates resources.
     - `delete.yml`: Destroys resources.

---

## **Actions**
- We can change name of variables in variable.tf file
- The output file can be changed to get the required output at completion of command `terraform destroy`
  
---

## **Outputs**
The Terraform script provides the following outputs:
- **Instance Public IP:** Use this IP to SSH into the instance or access the application.
- **Instance ID:** The unique identifier of the EC2 instance.
