# Craftista DevOps Project 

A polyglot microservices application containerized using Docker and automated with CI/CD pipelines.

---

##  Project Overview

This project demonstrates real-world DevOps practices by containerizing and orchestrating a multi-service application built using different technologies.

---

##  Architecture

The application consists of:

- **Frontend** → Node.js
- **Catalogue Service** → Python (Flask)
- **Recommendation Service** → Go (Gin)
- **Voting Service** → Java (Spring Boot)

---

##  Docker Implementation

- Created Dockerfiles for all services
- Used multi-stage builds for optimized images
- Implemented Docker Compose for orchestration
- Enabled inter-service communication using Docker networking

---

##  How to Run

bash:
docker-compose up --build

Access this app at:
http://localhost:3000

## CI/CD Pipeline (GitHub Actions)
Automated Docker image builds
Continuous Integration using GitHub Actions
(Next step: push images to Docker Hub)

## Challenges & Learnings
Fixed container networking issues (localhost vs service name)
Resolved multi-stage Docker build problems
Debugged API contract mismatches between services
Handled Docker cache corruption issues
Worked with multi-language microservices architecture

## ScreenShot:
<img width="2537" height="1304" alt="image" src="https://github.com/user-attachments/assets/10d3c932-5e11-4e0d-9e25-dcbd01751ea6" />

## Tech Stack
Docker & Docker Compose
GitHub Actions (CI/CD)
Node.js, Python, Go, Java

##  Kubernetes Deployment (Work in Progress)

This project is now deployed on Kubernetes using Minikube.

###  Implemented:
- Dockerized microservices
- Kubernetes Deployments & Services
- Service-to-service communication via DNS
- ConfigMap for externalized frontend configuration

###  Tech Stack:
- Docker
- Kubernetes (Minikube)
- GitHub Actions (CI)

###  Notes:
- Frontend configuration is now injected using Kubernetes ConfigMap
- No need to rebuild Docker images for config changes


## Author
Vipul Dhand
