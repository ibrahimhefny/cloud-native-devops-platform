# 🚀 Cloud-Native DevOps Platform (Azure Edition)

An automated end-to-end platform for deploying a microservices voting application on **Azure Kubernetes Service (AKS)** using **Terraform**, **Azure DevOps Pipelines**, and **Argo CD**.

---

## ✨ Project Overview
This repository demonstrates a full GitOps lifecycle:
* **Infrastructure as Code (IaC):** Modular Terraform for VNET, AKS, and Managed Identities.
* **CI/CD Pipelines:** Automated build, scan, and push workflows using Azure DevOps.
* **GitOps Deployment:** Continuous Delivery via Argo CD for the voting application.
* **Security:** Image scanning and secure container registry integration.

---

## 🧭 Architecture Summary
* **Cloud Provider:** Microsoft Azure.
* **Container Registry:** Docker Hub (or Azure Container Registry).
* **Orchestration:** AKS (Azure Kubernetes Service).
* **CD Pattern:** GitOps with Argo CD tracking the `/k8s` manifests.
* **Agent:** Self-hosted Linux agents for pipeline execution.

---

## 🗂️ Repository Structure

| Path | Purpose |
| :--- | :--- |
| `terraform/` | Terraform modules for Azure infrastructure (Network, AKS) |
| `pipelines/` | **[NEW]** Centralized Azure DevOps YAML definitions |
| `k8s/` | Kubernetes manifests and configuration files |
| `argo/` | Argo CD Application & Project specs |
| `voting-app/` | Application source code (Flask, Node.js) & Dockerfiles |

---

## 🧪 CI/CD Pipelines (Azure DevOps)

| Pipeline | Purpose | Trigger |
| :--- | :--- | :--- |
| `azure-pipelines-ci.yml` | Build & Push Docker images with unique Build IDs | Push to `main` |
| `azure-pipelines-infra.yml` | Terraform Plan/Apply for Azure Resources | Manual/Scheduled |
| `azure-pipelines-cd.yml` | Argo CD sync and manifest updates | Image update |

---

## 🛠️ Tech Stack & Tools
* ![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
* ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
* ![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
* ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
* ![ArgoCD](https://img.shields.io/badge/argocd-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)

---

## 📈 Observability & Quality
* **SonarQube:** Static Code Analysis (currently being integrated).
* **Docker Hub:** Centralized image management.
* **Azure Monitor:** (Optional) monitoring for AKS clusters.

---

## 🛡️ Security Highlights
* **Managed Identities:** Secure access to Azure resources without passwords.
* **Private Subnets:** AKS nodes are isolated within a private VNET.
* **Docker Multi-stage builds:** Optimized and secure image sizes.
