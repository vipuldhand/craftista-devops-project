# Craftista DevOps Project

## Overview

Craftista is a polyglot microservices-based application designed to demonstrate end-to-end DevOps practices in a production-like Kubernetes environment.

This project showcases the complete lifecycle of a modern DevOps system — from containerization and orchestration to infrastructure provisioning, deployment strategies, and cost-optimized cloud execution.

---

## Architecture

The system consists of multiple microservices built using different technologies:

* Frontend – Node.js
* Catalogue Service – Python (Flask)
* Recommendation Service – Go (Gin)
* Voting Service – Java (Spring Boot)

### System Architecture

```
                        ┌──────────────────────────┐
                        │        User / Browser    │
                        └────────────┬─────────────┘
                                     │
                             ┌───────▼────────┐
                             │  NGINX Ingress │
                             └───────┬────────┘
                                     │
        ┌────────────────────────────┼────────────────────────────┐
        │                            │                            │
┌───────▼────────┐        ┌──────────▼─────────┐        ┌────────▼────────┐
│   Frontend     │        │   Catalogue Service │       │ Recommendation  │
│   (Node.js)    │        │   (Flask/Python)    │       │ Service (Go)    │
└───────┬────────┘        └──────────┬─────────┘        └────────┬────────┘
        │                            │                            │
        │                    ┌───────▼────────┐                   │
        │                    │ Voting Service │                   │
        │                    │ (Spring Boot)  │                   │
        │                    └────────────────┘                   │
        │                                                         │
        └─────────────────────────────────────────────────────────┘
```

---

## Tech Stack

### Core DevOps Tools

* Docker, Docker Compose
* Kubernetes
* Helm

### Infrastructure

* AWS EKS
* Terraform

### CI/CD & Deployment

* GitHub Actions
* ArgoCD
* Argo Rollouts

### Observability

* Prometheus + Grafana
* Fluent Bit + Elasticsearch + Kibana

---

## Features Implemented

### Infrastructure as Code (NEW)

* Provisioned complete AWS infrastructure using Terraform:

  * Custom VPC with public subnets
  * EKS cluster with managed node groups
* Automated cluster authentication using AWS CLI
* Implemented infrastructure lifecycle management (create/destroy)

---

### Kubernetes Deployment

* Deployed microservices on Amazon EKS
* Configured:

  * Deployments
  * Services (ClusterIP, NodePort)
  * ConfigMaps for runtime configuration
* Enabled internal service communication via Kubernetes DNS

---

### Public Exposure (Cost-Optimized)

* Exposed application using NodePort instead of LoadBalancer
* Configured Helm to dynamically switch service type
* Enabled public access via EC2 public IP and NodePort
* Avoided AWS load balancer costs

---

### Helm-Based Configuration

* Parameterized deployments using values.yaml
* Implemented conditional logic for:

  * Rollout strategies
  * Service types (ClusterIP / NodePort)
* Created reusable and environment-driven templates

---

### Deployment Strategies

* Implemented progressive delivery using Argo Rollouts:

  * Canary deployments
  * Blue-Green deployments
* Configurable via Helm values

---

### Observability

* Metrics collection using Prometheus
* Visualization using Grafana
* Centralized logging using EFK stack:

  * Fluent Bit → Elasticsearch → Kibana

---

## Real-World Debugging & Issues Resolved

* Resolved EKS authentication and kubeconfig issues
* Fixed VPC CNI conflicts during cluster provisioning
* Debugged Kubernetes networking issues causing pods to remain NotReady
* Resolved Argo Rollouts CRD conflicts and RBAC permission errors
* Fixed Helm deployment conflicts with rollout-managed services
* Debugged application crash due to missing ConfigMap mount
* Resolved port-forwarding failures caused by incorrect service selectors
* Diagnosed scheduling failures due to insufficient node capacity

---

## Docker Implementation

* Created optimized Dockerfiles for each microservice
* Configured Docker Compose for local development
* Enabled inter-service communication using container networking

---

## Running the Application (Local)

```bash
helm install craftista ./helm/craftista-chart
```

---

## Running on AWS EKS (Terraform-Based)

### Step 1: Initialize Terraform

```bash
cd craftista-infra
terraform init
```

### Step 2: Create Infrastructure

```bash
terraform apply
```

### Step 3: Configure kubectl

```bash
aws eks update-kubeconfig --region ap-south-1 --name craftista-eks-cluster
```

### Step 4: Deploy Application

```bash
helm upgrade --install craftista ../helm/craftista-chart
```

---

## Access Application (AWS)

```bash
kubectl get svc craftista-frontend-service
```

Access via:

```
http://<EC2-PUBLIC-IP>:<NODEPORT>
```

---

## Destroy Infrastructure (Cost Optimization)

```bash
terraform destroy
```

---

## Project Structure

```
craftista/
├── frontend/
├── catalogue/
├── recommendation/
├── voting/
├── craftista-infra/        # Terraform (NEW)
├── helm/
│   └── craftista-chart/
├── k8s/
├── docker-compose.yml
└── README.md
```

---

## Key Highlights

* End-to-end DevOps pipeline implementation
* Infrastructure provisioning using Terraform
* Kubernetes deployment on AWS EKS
* Advanced rollout strategies using Argo Rollouts
* Cost optimization by avoiding managed load balancers
* Real-world debugging and production issue handling

---

## Credits

This project is based on the Craftista application originally created by School of DevOps.

---

## Author

Vipul Dhand
