# 🚀 Roboshop Infrastructure (Dev Environment)

## 📌 Overview

This repository provisions a **complete microservices-based infrastructure on AWS using Terraform**, designed to simulate a real-world e-commerce platform.

The architecture focuses on **scalability, secure networking, and modular infrastructure**, enabling independent service deployment and efficient traffic routing across components.

---

## 🏗 Architecture

<!-- ![Architecture Diagram](./architecture.png) -->
![Architecture Diagram](./roboshop-infra-dev.svg)

---

## 🔄 Request Flow

1. User accesses the application via browser
2. Request is routed to the **Frontend Application Load Balancer (ALB)**
3. Traffic is forwarded to the **Frontend (Nginx)**
4. Frontend communicates with the **Backend ALB**
5. Backend ALB routes requests using **path-based routing**:

   * `/catalogue` → Catalogue service
   * `/user` → User service
   * `/cart` → Cart service
   * `/shipping` → Shipping service
   * `/payment` → Payment service
6. Each service interacts with its respective datastore

---

## 🧱 Infrastructure Design

### 🌐 Networking

* Custom **VPC**
* **2 Public Subnets**
* **2 Private Subnets**
* **2 Database Subnets**
* Internet access via **Internet Gateway**
* Outbound access from private subnets via **NAT Gateway**

---

### 🔐 Security & Access

* Backend and database instances are deployed in **private subnets**
* **Bastion Host** for controlled SSH access
* **VPN access** for secure connectivity
* Security groups enforce **layered access control**

---

### ⚖️ Load Balancing

* **Frontend ALB** → Handles incoming user traffic
* **Backend ALB** → Routes traffic to microservices
* **Path-based routing** implemented using ALB listener rules

---

### 🚀 Compute & Auto Scaling

* Backend services run on **EC2 instances**
* Managed using:

  * Launch Templates
  * Auto Scaling Groups
* Auto Scaling configuration:

  * **Min instances:** 1
  * **Max instances:** 10
  * **Policy:** Target Tracking Scaling
  * **Metric:** CPU Utilization

---

### 🔧 Service Deployment

* Instances are provisioned using **user data scripts**
* Scripts trigger **Ansible playbooks**
* Ansible handles:

  * Service installation
  * Configuration
  * Deployment

---

### 🧩 Microservices

The backend is composed of independently deployable services:

* Catalogue
* User
* Cart
* Shipping
* Payment

This architecture enables:

* Loose coupling
* Independent scaling
* Flexible deployments

---

### 🗄 Databases

| Service   | Database        |
| --------- | --------------- |
| Catalogue | MongoDB         |
| User      | MongoDB + Redis |
| Cart      | Redis           |
| Shipping  | MySQL           |
| Payment   | RabbitMQ        |

---

### 🌍 CDN & Frontend

* **CloudFront CDN** used for:

  * Caching static frontend content
  * Improving latency and performance
* Frontend served using **Nginx**

---

### 🔐 Configuration Management

* **AWS Parameter Store** used for storing configuration values
* Enables centralized and secure configuration management

---

### 🧩 Modular Design

* **VPC and Backend components are implemented using reusable Terraform modules**
* Modules are maintained in **separate repositories**
* Promotes:

  * Reusability
  * Maintainability
  * Cleaner infrastructure code

---

## 📁 Project Structure

```bash
.
├── vpc/
├── sg/
├── bastion/
├── vpn/
├── databases/
├── backend-alb/
├── frontend-alb/
├── acm/
├── components/
├── cdn/
```

---

## ⚙️ Key Highlights

* Multi-tier architecture (Frontend → Backend → Database)
* Path-based routing using ALB
* Auto Scaling based on CPU utilization
* Secure infrastructure with private subnets, VPN, and Bastion
* Modular Terraform design
* Configuration managed via Parameter Store
* CDN integration for performance optimization

---

## 🚀 Deployment Steps

```bash
git clone https://github.com/PraneethReddy2701/15-roboshop-infra-dev.git
cd 15-roboshop-infra-dev

terraform init
terraform plan
terraform apply
```

---

## 📌 Prerequisites

* AWS CLI configured
* Terraform installed
* Appropriate IAM permissions

---

## 📫 Author

**Praneeth Reddy**
DevOps Engineer

* 📍 Hyderabad, India
* 🔗 LinkedIn: https://linkedin.com/in/praneeth-reddy-kotholla
