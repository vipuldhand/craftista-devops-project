# Craftista DevOps Project 

##  Overview

Craftista is a **polyglot microservices-based application** designed to demonstrate **end-to-end DevOps practices in a production-like Kubernetes environment**.

This project showcases the complete lifecycle of a modern DevOps system — from containerization and orchestration to **deployment strategies, monitoring, and centralized logging**.

---

##  Architecture

The system consists of multiple microservices built using different technologies:

* **Frontend** – Node.js
* **Catalogue Service** – Python (Flask)
* **Recommendation Service** – Go (Gin)
* **Voting Service** – Java (Spring Boot)

### System Architecture

```
                        ┌──────────────────────────┐
                        │        User / Browser    │
                        └────────────┬─────────────┘
                                     │
                             ┌───────▼────────┐
                             │  NGINX Ingress │
                             │  (craftista.local)
                             └───────┬────────┘
                                     │
        ┌────────────────────────────┼────────────────────────────┐
        │                            │                            │
┌───────▼────────┐        ┌──────────▼─────────┐        ┌────────▼────────┐
│   Frontend     │        │   Catalogue Service │        │ Recommendation  │
│   (Node.js)    │        │   (Flask/Python)    │        │ Service (Go)    │
└───────┬────────┘        └──────────┬─────────┘        └────────┬────────┘
        │                            │                            │
        │                            │                            │
        │                    ┌───────▼────────┐                   │
        │                    │ Voting Service │                   │
        │                    │ (Spring Boot)  │                   │
        │                    └────────────────┘                   │
        │                                                         │
        └─────────────────────────────────────────────────────────┘


====================== OBSERVABILITY LAYER ======================

   Logs Flow:
   Pods → Fluent Bit → Elasticsearch → Kibana

   Metrics Flow:
   Pods → Prometheus → Grafana

=================================================================

====================== DEPLOYMENT FLOW ===========================

   GitHub → GitHub Actions → ArgoCD → Kubernetes Cluster

   Deployment Strategies:
   - Canary Releases
   - Blue-Green Deployments

=================================================================
```

### Key Architectural Highlights:

* Microservices communicate via **Kubernetes internal DNS**
* Configuration is externalized using **ConfigMaps**
* Services are deployed using **Helm charts**
* Traffic routing handled via **NGINX Ingress**
* Progressive delivery using **Argo Rollouts (Canary + Blue/Green)**

---

##  Tech Stack

### Core DevOps Tools

* **Containerization**: Docker, Docker Compose
* **Orchestration**: Kubernetes (Minikube)
* **Package Management**: Helm

### CI/CD & Deployment

* **GitOps**: ArgoCD
* **Deployment Strategies**: Canary & Blue-Green (Argo Rollouts)
* **CI Pipeline**: GitHub Actions

### Observability 

* **Monitoring**: Prometheus + Grafana
* **Logging**: Fluent Bit → Elasticsearch → Kibana (EFK Stack)

### Languages

* Node.js, Python, Go, Java

---

##  Features Implemented

###  Infrastructure & Deployment

* Fully containerized microservices architecture
* Kubernetes-based deployments with Helm templating
* Dynamic configuration using ConfigMaps
* Internal service discovery via Kubernetes DNS

###  Networking

* NGINX Ingress Controller setup
* Path-based routing for microservices
* Custom domain (`craftista.local`) configuration

###  Deployment Strategies

* Blue-Green deployment using Argo Rollouts
* Canary deployment with traffic splitting
* GitOps-based deployment using ArgoCD

###  Observability (Major Highlight)

* Metrics collection using Prometheus
* Grafana dashboards for real-time monitoring
* Centralized logging using EFK stack:

  * Fluent Bit collects logs from Kubernetes pods
  * Elasticsearch stores logs
  * Kibana used for real-time log analysis and debugging

---

##  Logging & Debugging (Real DevOps Use Case)

* Implemented centralized logging pipeline using Fluent Bit
* Successfully debugged Kubernetes issues using Kibana logs
* Identified service endpoint mismatches via logs
* Enabled real-time log querying using Kibana Discover

 Example:

* Detected missing service endpoints (`*-stable`) through ingress logs
* Verified system health using `kubectl` and log correlation

---

##  Docker Implementation

* Created optimized Dockerfiles for each service
* Used multi-stage builds to reduce image size
* Configured Docker Compose for local development
* Enabled inter-service communication via Docker networking

---

##  Kubernetes & Helm

* Defined Deployments and Services for all microservices
* Used ClusterIP and NodePort services appropriately
* Packaged application using Helm charts
* Parameterized deployments via `values.yaml`
* Used ConfigMaps for runtime configuration

---

##  CI/CD Pipeline

* Automated build process using GitHub Actions
* Continuous integration for code validation
* Structured pipeline for future Docker registry integration

---

##  Challenges & Learnings

* Debugged Kubernetes service discovery issues
* Fixed Helm templating and naming conflicts
* Implemented ConfigMap-based dynamic configuration
* Troubleshot Fluent Bit → Elasticsearch connectivity issues
* Resolved logging errors related to deprecated `_type` field
* Used Kibana to identify and analyze system-level logs
* Understood interaction between Ingress, Services, and Endpoints

---

##  Running the Application

### Prerequisites

* Docker
* Minikube
* Helm

### Deploy using Helm

```bash
helm install craftista ./helm/craftista-chart
```

### Access the application

```bash
minikube service craftista-frontend-service
```

---

##  Project Structure

```
craftista/
├── frontend/
├── catalogue/
├── recommendation/
├── voting/
├── helm/
│   └── craftista-chart/
├── k8s/
├── docker-compose.yml
└── README.md
```

---

##  Screenshots

### ArgoCD Deployment (Canary + Blue-Green)

<img width="977" height="600" src="https://github.com/user-attachments/assets/0c92b9cd-bd0b-492c-8b45-9c01bc37207e" />

<img width="1032" height="522" src="https://github.com/user-attachments/assets/360331ac-43e5-4b1d-b568-1024392e4ff4" />

### Application UI

<img width="2550" height="1306" src="https://github.com/user-attachments/assets/1c357986-7915-4df3-bc0c-e0da70102fed" />

---
## Deploy on AWS EKS (Production Setup)

This project can be deployed to a managed Kubernetes environment using Amazon EKS.

### Prerequisites

* AWS CLI configured
* eksctl installed
* kubectl installed
* Helm installed

### Step 1: Create EKS Cluster

```bash
eksctl create cluster \
  --name craftista-cluster \
  --region ap-south-1 \
  --nodegroup-name standard-workers \
  --node-type t3.medium \
  --nodes 2
```

### Step 2: Configure kubectl

```bash
aws eks update-kubeconfig --region ap-south-1 --name craftista-cluster
```

### Step 3: Install Ingress Controller

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

### Step 4: Deploy Application

```bash
helm install craftista ./helm/craftista-chart
```

### Step 5: Setup Observability Stack

* Install Prometheus and Grafana using Helm
* Deploy Elasticsearch and Kibana
* Configure Fluent Bit for log forwarding

### Step 6: Access Application

* Use AWS LoadBalancer service or Ingress
* Map domain via Route53 (optional)

---

### Production Improvements

* Use AWS Load Balancer Controller
* Store secrets in AWS Secrets Manager
* Enable auto-scaling with HPA
* Use managed Elasticsearch (OpenSearch)

```
```
---

##  Credits

This project is based on the Craftista application originally created by **School of DevOps**.

This repository extends the original application by implementing advanced DevOps practices including Kubernetes orchestration, Helm packaging, CI/CD, and observability.

* https://schoolofdevops.com/
* https://github.com/craftista/craftista

---

##  Author

**Vipul Dhand**
