# Leeds Beckett University Cloud Computing Lab

## Deployment of ReviewBook System using Kubernetes and Redis on Digital Ocean
---

## Introduction
This lab involves deploying the ReviewBook application using Kubernetes (K8s) and Redis on Digital Ocean. It provides an in-depth understanding of Kubernetes' orchestration capabilities, Redis as a database, and the Digital Ocean cloud platform.

### Key Concepts
- **Kubernetes (K8s)**: An open-source system for automating deployment, scaling, and management of containerized applications.
- **Redis**: An in-memory data structure store, used as a database, cache, and message broker.
- **Digital Ocean**: A cloud platform offering Infrastructure-as-a-Service.

---

## Lab Structure

### Introduction to Kubernetes
Kubernetes, or K8s, is a powerful tool for managing containerized applications, offering features like automated scheduling, self-healing, load balancing, and horizontal scaling.

### Step-by-Step Guide

#### Step Zero: Prerequisites
- Set up a DigitalOcean account.
- Install `kubectl`, `doctl`, and optionally Docker Desktop.
- Clone the lab Git repository: `git clone https://github.com/dxnkramer/k8-ReviewBook-go`.

#### Step One: Creating the Kubernetes Cluster on DigitalOcean
- Generate a DigitalOcean API Token.
- Authorize `doctl` using the API token.
- Create a Kubernetes cluster with `doctl kubernetes cluster create`.

#### Step Two: Creating the Redis Master Pod
- Deploy a Redis Master Pod using `redis-master-controller.yaml`.
- Check the pod's status with `kubectl get pods`.

#### Step Three: Creating the Redis Master Service
- Establish the Redis Master Service using `redis-master-service.yaml`.
- Verify the service with `kubectl get services`.

#### Step Four: Creating the Redis Replica Pods
- Set up Redis Replica Pods with `redis-replica-controller.yaml`.
- Confirm their status with `kubectl get pods`.

#### Step Five: Creating the Redis Replica Service
- Create the Redis Replica Service using `redis-replica-service.yaml` and `redis-slave-service.yaml`.
- Validate the service with `kubectl get services`.

#### Step Six: Creating the ReviewBook Pods
- Deploy the ReviewBook Pods using `ReviewBook-controller.yaml`.
- Check the pods with `kubectl get pods`.

#### Step Seven: Creating the ReviewBook Service
- Set up the ReviewBook Service with `ReviewBook-service.yaml`.
- Verify the service's accessibility with `kubectl get services`.

#### Step Eight: Interacting with the ReviewBook
- Access the ReviewBook application via the external IP address provided by `kubectl get services`.

#### Step Nine: Cleanup and Destroy
- Remove all resources with `kubectl delete -f .` and `doctl kubernetes cluster delete <Cluster-Name>`.

### Advanced Tasks
- Experiment with modifying replica counts and resource limits in `ReviewBook-controller.yaml`.

### Appendix
- **Appendix A**: Using the .tar File
- **Appendix B**: Building a Docker Image from Repository Files

---

## References
- Kubernetes, Docker, DigitalOcean, and related technologies (detailed references provided in the lab sheet).

---