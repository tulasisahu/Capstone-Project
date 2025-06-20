# 🚀 DevOps Lifecycle Pipeline for Abode Software

This project implements a complete DevOps lifecycle for Abode Software, a product-based company. The source code is based on [hshar/website](https://github.com/hshar/website). It features end-to-end CI/CD automation using open-source DevOps tools.

---

## 🛠️ Tech Stack
- **Terraform** – Infrastructure provisioning (AWS EC2)
- **Ansible** – Configuration Management (Install Jenkins, Docker)
- **Jenkins** – CI/CD pipeline with 3-stage jobs
- **Docker** – Containerization of the web app
- **GitHub** – Source control & webhook integration

---

## 📌 Pipeline Specifications

### Git Workflow
- `develop` branch: Build and Test
- `master` branch: Build, Test, and Deploy to Production

### Jenkins Pipeline Jobs
| Stage | Description |
|-------|-------------|
| `Job 1: Build` | Clone repo, build Docker image |
| `Job 2: Test` | Run the container and test endpoints |
| `Job 3: Prod` | Tag, push Docker image, and deploy on prod server |

---

## 🔧 Infrastructure Setup (AWS Free Tier)

| Instance       | Purpose                    |
|----------------|----------------------------|
| `jenkins-server` | CI/CD pipeline, Jenkins, Docker |
| `prod-server`    | Production deployment (Docker only) |

Provisioned using Terraform with the following components:
- Custom VPC, Subnet, IGW
- Security Group (ports 22, 80, 8080)
- 2 EC2 Ubuntu 22.04 instances (t2.micro)

---

## 📁 Project Structure
devops-lifecycle-abode/
├── Dockerfile
├── Jenkinsfile
├── README.md
├── ansible/
│ └── install-devops-stack.yml
└── terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars


---

## 🐳 Docker Setup

Using prebuilt base image:
```Dockerfile
FROM hshar/webapp
COPY . /var/www/html

🔄 GitHub Webhook Setup
Navigate to your repo → Settings → Webhooks

Payload URL: http://<jenkins-ip>:8080/github-webhook/

Content type: application/json

Event: Just the push event

✅ How to Run
terraform apply – Launch EC2 infrastructure

Use Ansible to install Jenkins and Docker

Push code to GitHub (develop or master)

Jenkins auto-triggers pipeline based on branch

View app at http://<prod-server-ip>

👨‍💻 Author
Tulasi Kumar Sahu
🔗 GitHub: Tks-Devops

