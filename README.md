# 🚀 Cloud-Native DevOps Platform 


End-to-end DevOps platform for deploying a microservices applicationS on **AWS EKS** using **Terraform** for IaC, **Azure DevOps Pipelines** for CI, and **Argo CD** with **Helm** for GitOps-based CD.

---

## 🏗️ Execution Workflow

The project was executed in a structured 8-step process:

1. **Infrastructure Provisioning:** Automated setup of **AWS EKS** using **Terraform**.
2. **Networking & API Exposure:** Implementation of **Ingress**, **API Gateway**, and **Cognito** for secure access.
3. **Platform Services:** Deploying core DevOps tools (**Nexus**, **SonarQube**, and **Argo CD**).
4. **Backend Microservices:** Containerizing applications using **Docker** and **Helm**.
5. **CI Pipeline:** Automated build and security scanning via **Azure DevOps**.
6. **CD Pipeline & GitOps:** Continuous Delivery with **Argo CD** and vulnerability scanning with **Trivy**.
7. **Secrets Management:** Secure credential handling through **HashiCorp Vault** integration.
8. **Database & Monitoring:** Configuring **MongoDB Atlas** and **Datadog** for observability.
   

---

## 🧭 Architecture Summary
* **Cloud Providers:**  AWS.
* **Container Registry:** Docker Hub.
* **Orchestration:**  EKS (AWS).
* **CD Pattern:** GitOps with Argo CD tracking the `/k8s` manifests.
* **Agent:** Self-hosted Linux agents for pipeline execution.

---

## 🗂️ Repository Structure

| Path | Purpose |
| :--- | :--- |
| `terraform/` | Terraform modules for Azure & AWS infrastructure |
| `pipelines/` | **[NEW]** Centralized Azure DevOps YAML definitions |
| `k8s/` | Kubernetes manifests and configuration files |
| `argo/` | Argo CD Application & Project specs |
| `voting-app/` | Application source code & Dockerfiles |
| `screenshots/` | Proof of implementation & dashboard captures |

---
## 🧰 Tech Stack & Implementation Proof
*(Click on badges to view implementation screenshots)*


* [![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)](./screenshots/aws-eks.png.png)
* [![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](./screenshots/terraform-output.png.png)
* [![Azure Pipelines](https://img.shields.io/badge/Azure_Pipelines-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](./screenshots/azure-portal.png.png)
* [![Docker](https://img.shields.io/badge/Docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](./screenshots/docker-hub.png.png)
* [![ArgoCD Hello](https://img.shields.io/badge/ArgoCD_Hello-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](./screenshots/argo-hello.png.png)
* [![ArgoCD Voting](https://img.shields.io/badge/ArgoCD_Voting-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](./screenshots/argo-voting.png.png)

---

## 🧪 CI/CD Pipelines (Azure DevOps)

| Pipeline | Purpose | Key Steps |
| :--- | :--- | :--- |
| `azure-pipelines-ci.yml` | **Application CI** | Docker Build -> Tagging -> Push to Registry |
| `azure-pipelines-infra.yml` | **Infrastructure IaC** | Terraform Init -> Plan -> Apply for Resources |
| `azure-pipelines-cd.yml` | **GitOps Trigger** | Updates manifests to trigger ArgoCD Sync |
| `azure-pipelines-platform.yml`| **Platform Tools** | Deploying Ingress & Monitoring Controllers |

---

## 🚀 Quick Start Guide

### 1. Provision Infrastructure
```bash
cd terraform
terraform init
terraform apply -var-file=nonprod.tfvars
