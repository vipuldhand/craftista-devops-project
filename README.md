# Craftista DevOps Project

## Overview

Craftista is a polyglot microservices-based application designed to demonstrate end-to-end DevOps practices. The project showcases containerization, orchestration, and configuration management using Docker, Kubernetes, and Helm.

The system consists of multiple services built using different programming languages, communicating seamlessly within a Kubernetes cluster.

---

## Architecture

The application is composed of the following microservices:

* **Frontend** – Node.js
* **Catalogue Service** – Python (Flask)
* **Recommendation Service** – Go (Gin)
* **Voting Service** – Java (Spring Boot)

Key architectural features:

* Microservices communicate via internal Kubernetes DNS
* Frontend configuration is externalized using ConfigMaps
* Services are deployed and managed using Helm charts

---

## Technology Stack

* **Containerization**: Docker, Docker Compose
* **Orchestration**: Kubernetes (Minikube)
* **Package Management**: Helm
* **CI/CD**: GitHub Actions
* **Languages**: Node.js, Python, Go, Java

---

## Features

* Fully containerized microservices architecture
* Kubernetes-based deployment using Deployments and Services
* Helm templating for reusable and environment-agnostic configurations
* ConfigMap-based dynamic configuration (no image rebuild required)
* Internal service discovery using Kubernetes DNS

---

## Docker Implementation

* Created Dockerfiles for each microservice
* Used multi-stage builds to optimize image size
* Configured Docker Compose for local development
* Enabled inter-service communication via Docker networking

---

## Kubernetes and Helm

* Defined Kubernetes manifests for all services
* Implemented ClusterIP and NodePort services appropriately
* Packaged application using Helm charts
* Parameterized deployments using `values.yaml`
* Used ConfigMaps to inject runtime configuration into containers

---

## CI/CD Pipeline

* Automated build process using GitHub Actions
* Continuous integration for code validation and image builds
* Structured pipeline for future Docker Hub integration

---

## Challenges and Learnings

* Resolved service communication issues caused by incorrect hostnames
* Debugged Kubernetes service discovery and DNS resolution
* Fixed Helm templating and resource naming conflicts
* Implemented ConfigMap volume mounting and handled update propagation
* Worked with multi-language microservices in a unified environment

---

## Running the Application

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

## Project Structure

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

## Screenshot

<img width="2550" height="1306" alt="image" src="https://github.com/user-attachments/assets/1c357986-7915-4df3-bc0c-e0da70102fed" />


---

## Author

Vipul Dhand
