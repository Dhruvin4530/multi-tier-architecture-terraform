# Multi tier architecture using terraform
Deploy a scalable and resilient multi-tier architecture on AWS using Terraform

# :rocket: Project Overview
This project allows us to deploy a highly available, scalable, and secure multi-tier architecture on Amazon Web Services (AWS) using Terraform. The architecture consists of the following three tiers:

* **Web Tier**: This tier handles incoming user requests and can be horizontally scaled for increased capacity. It typically includes web servers and a load balancer for distributing traffic.

* **Application Tier**: Application servers run our business logic and interact with the database tier. They can also be horizontally scaled to meet demand.

* **Database Tier**: The database stores and manages our application data. In this architecture, we use Amazon RDS for a managed database service.

# 📌 Architecture Diagram
![1](https://github.com/Dhruvin4530/multi-tier-architecture-terraform/blob/main/1.jpg)

# 🔯 Prerequisites
* Terraform installed
* AWS account with appropriate permissions

# ⭐ Setup Instructions 
**1. Running locally**
* Clone the Repository
  ```
  git clone https://github.com/Dhruvin4530/multi-tier-architecture-terraform.git
  cd multi-tier-architecture-terraform
  ```

* Add the AWS credentials to the `provider.tf` file and change your dynamodb table name.
  
* Edit `terraform.tfvars` as per your need.

* This code will fetch the database password from AWS secrets manager so, you need to store your password with db_password key in AWS secrets manager.

  
* Initialize Terraform
  ```
  terraform init
  ```

* Apply the Configuration
  ```
  terraform apply
  ```

**2. Run using GitHub Action workflow**
* Fork the Repository

* Change the dynamodb table name as per yours to the `provider.tf` file

* Edit `terraform.tfvars` as per your need.

* This code will fetch the database password from AWS secrets manager so, you need to store your password with db_password key in AWS secrets manager.

* This repository contains 2 workflow. One will trigger on every pull request which will validate the terraform code & one will trigger on commit in main branch which will deploy the changes.

# 🌟 Directory Structure
* `main.tf`: Main configuration file.
* `variables.tf`: Variable definitions.
* `terraform.tfvars`: User-specific variable values.
* `provider.tf`: Provider configuration.
* `locals.tf`: Local values.
* `modules/`: Contains reusable modules.

# 🤝 Contributing
Feel free to submit issues or pull requests. Contributions are welcome to improve this project.

