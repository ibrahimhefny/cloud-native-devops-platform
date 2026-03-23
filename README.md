# 🚀 Cloud-Native DevOps Platform 

An automated GitOps platform demonstrating multi-cloud infrastructure and microservices deployment.

---

## 🧰 Tech Stack & Implementation Proof
*(Click on badges to see my implementation screenshots)*

* [![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](./screenshots/azure-portal.png)
* [![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)](./screenshots/aws-eks.png)
* [![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](./screenshots/terraform-output.png)
* [![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](./screenshots/docker-hub.png)
* [![ArgoCD Hello](https://img.shields.io/badge/ArgoCD_Hello-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](./screenshots/argo-hello.png)
* [![ArgoCD Voting](https://img.shields.io/badge/ArgoCD_Voting-%23ef7b4d.svg?style=for-the-badge&logo=argocd&logoColor=white)](./screenshots/argo-voting.png)

---

## 🗂️ Repository Structure

| Path | Purpose |
| :--- | :--- |
| `terraform/` | IaC modules for Hybrid-Cloud setup (VNET, AKS, EKS) |
| `pipelines/` | Centralized Azure DevOps YAML definitions |
| `k8s/` | Kubernetes manifests for both Hello and Voting apps |
| `argo/` | Argo CD GitOps Application & Project specs |
| `voting-app/` | Microservices source code & Dockerfiles |

---

## 🧪 CI/CD & GitOps Lifecycle
1. **Infrastructure:** Terraform modules deployed via automated pipelines.
2. **Continuous Integration:** Docker builds with unique tagging for microservices.
3. **GitOps Delivery:** Argo CD manages two separate environments (Hello App & Voting App).
