# 🚀 Cloud-Native DevOps Platform 

An automated GitOps platform demonstrating multi-cloud infrastructure and microservices deployment with a focus on Clean Code and Project Structure.

---

## 🧰 Tech Stack & Implementation Proof
*(Click on badges to see my implementation screenshots)*

* [![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/azure-portal.png)
* [![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/aws-eks.png)
* [![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/terraform-output.png)
* [![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/docker-hub.png)
* [![ArgoCD Hello](https://img.shields.io/badge/ArgoCD_Hello-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/argo-hello.png)
* [![ArgoCD Voting](https://img.shields.io/badge/ArgoCD_Voting-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](https://github.com/ibrahimhefny/cloud-native-devops-platform/blob/main/screenshots/argo-voting.png)

---

## 🧪 CI/CD Pipelines Deep Dive

تم تنظيم كافة الـ Pipelines داخل مجلد `pipelines/` لضمان نظافة المشروع:

| Pipeline File | Purpose | Key Steps |
| :--- | :--- | :--- |
| `azure-pipelines-infra.yml` | **Infrastructure as Code** | Terraform Init -> Plan -> Apply لتجهيز الـ VNET والـ AKS. |
| `azure-pipelines-ci.yml` | **Application CI** | Build Docker Images -> Tagging (BuildId) -> Push to Docker Hub. |
| `azure-pipelines-cd.yml` | **GitOps Delivery** | تحديث الـ K8s Manifests لتبدأ ArgoCD عملية الـ Sync التلقائي. |
| `azure-pipelines-platform.yml` | **Platform Tooling** | تثبيت الـ Ingress Controllers والـ Monitoring Tools. |

---

## 🚀 Quick Start (How to run this project)

### 1. Provision Infrastructure
```bash
cd terraform
terraform init
terraform apply -var-file=nonprod.tfvars
