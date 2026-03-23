# 🚀 Cloud-Native DevOps Platform (Azure & AWS)

An automated end-to-end platform for deploying a microservices voting application on **Azure Kubernetes Service (AKS)** and **AWS EKS** using **Terraform**, **Azure DevOps Pipelines**, and **Argo CD**.

---

## ✨ Project Overview
This repository demonstrates a full GitOps lifecycle:
* **Infrastructure as Code (IaC):** Modular Terraform for VNET, AKS, and Managed Identities.
* **CI/CD Pipelines:** Automated build, scan, and push workflows using Azure DevOps.
* **GitOps Deployment:** Continuous Delivery via Argo CD for the voting application.
* **Security:** Image scanning and secure container registry integration.

---

## 🧭 Architecture Summary
* **Cloud Providers:** Microsoft Azure & AWS.
* **Container Registry:** Docker Hub.
* **Orchestration:** AKS (Azure) & EKS (AWS).
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

* [![Azure](https://img.shields.io/badge/Azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/azure-portal.png)
* [![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/aws-eks.png)
* [![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/terraform-output.png)
* [![Docker](https://img.shields.io/badge/Docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/docker-hub.png)
* [![ArgoCD Hello](https://img.shields.io/badge/ArgoCD_Hello-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/argo-hello.png)
* [![ArgoCD Voting](https://img.shields.io/badge/ArgoCD_Voting-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](https://raw.githubusercontent.com/ibrahimhefny/cloud-native-devops-platform/main/screenshots/argo-voting.png)

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
