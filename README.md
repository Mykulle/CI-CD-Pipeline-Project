## CI/CD Pipeline with Jenkins, SonarQube, Docker, and ArgoCD

### Project Overview
This project implements a CI/CD pipeline using Jenkins, SonarQube, Docker, and ArgoCD to automate building, testing, and deploying applications efficiently.

---

## Infrastructure Setup
This CI/CD setup is deployed on **AWS EC2 instances**, with the following components:
- **Jenkins UI** - Configured with a domain name and secured with Nginx reverse proxy.
- **Jenkins Agent** - Dedicated VM to execute build jobs.
- **SonarQube** - For static code analysis.
- **ArgoCD** - For GitOps-based continuous deployment.
- **Application Cluster** - Kubernetes cluster hosting the application.

An **Nginx reverse proxy** is used to manage secure access to the Jenkins UI.

---

## Prerequisites
Ensure the following tools are installed and configured:
- AWS EC2 instances for Jenkins, SonarQube, ArgoCD, and the application cluster.
- **Jenkins** (with TLS and a custom domain).
- **SonarQube** (with TLS for security scans).
- **Docker** (for building and pushing images).
- **Kubernetes Cluster** (for deploying the application).
- **ArgoCD** (for continuous deployment via GitOps).
- **Nginx** (as a reverse proxy for Jenkins UI).

---

## Installation & Configuration

### 1. Install & Configure Jenkins
1. Deploy Jenkins on an AWS EC2 instance and secure it with Nginx as a reverse proxy.
2. Install required plugins: `Pipeline`, `Git`, `Docker`, `Kubernetes`, `SonarQube Scanner`.
3. Configure Jenkins credentials for:
   - Git repository access
   - Docker Hub authentication
   - SonarQube integration
4. Set up a pipeline job to automate builds and deployments.

### 2. Install & Configure SonarQube
1. Deploy SonarQube on a dedicated AWS EC2 instance.
2. Generate an authentication token for Jenkins integration.
3. Configure SonarQube quality gates and security checks.

### 3. Install & Configure Docker
1. Install Docker on the Jenkins agent node.
2. Authenticate Jenkins with Docker Hub.
3. Define a `Dockerfile` and automate Docker image tagging and pushing.

### 4. Kubernetes Deployment
1. Set up a Kubernetes cluster on AWS EC2 instances.
2. Store Kubernetes manifests in a **GitOps** repository.

### 5. Install & Configure ArgoCD
1. Deploy ArgoCD in the Kubernetes cluster.
2. Configure ArgoCD to track the GitOps repository.
3. Set up automated deployment triggers.

---

## CI/CD Pipeline Workflow

1. **Code Commit**: Developers push code to the GitHub repository.
2. **Jenkins Build Pipeline**:
   - Jenkins pulls the latest code.
   - Runs static code analysis using SonarQube.
   - Builds a Docker image and pushes it to Docker Hub.
   - Updates Kubernetes manifests with the new image tag.
   - Pushes the updated manifests to the GitOps repository.
3. **ArgoCD Deployment**:
   - ArgoCD detects changes in the GitOps repository.
   - Deploys the updated application to Kubernetes.

---

## Monitoring & Debugging
- **Jenkins Logs**: Check pipeline logs for errors.
- **SonarQube Dashboard**: Review code quality issues.
- **Docker Logs**: Inspect container logs.
- **Kubernetes Commands**:
  - `kubectl get pods` – Check pod status.
  - `kubectl logs <pod-name>` – View logs for a specific pod.
- **ArgoCD UI**: Monitor deployment status and rollback if needed.

---

## Conclusion
This project successfully implements a CI/CD pipeline using **Jenkins, SonarQube, Docker, and ArgoCD**, enabling automated builds, testing, and deployments in a Kubernetes environment. The infrastructure is hosted on **AWS EC2 instances**, and the Jenkins UI is secured using **Nginx reverse proxy** with a custom domain.

This pipeline ensures:
- Faster and more reliable software releases.
- Automated code quality and security checks.
- Efficient Kubernetes deployments using GitOps principles.
