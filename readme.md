# ReviewBook Kubernetes Deployment Lab

## Lab Contents

- **Introduction**
  - Overview of the lab objectives.
  - A brief introduction to Kubernetes and the ReviewBook application.
- **Step Zero: Prerequisites**
- **Step One: Creating the Kubernetes Cluster on DigitalOcean**
- **Step Two: Creating the Redis Master Pod**
- **Step Three: Creating the Redis Master Service**
- **Step Four: Creating the Redis Replica Pods**
- **Step Five: Creating the Redis Replica Service**
- **Step Six: Creating the ReviewBook Pods**
- **Step Seven: Creating the ReviewBook Service**
- **Step Eight: Interacting with the ReviewBook**
- **Step Nine: Cleanup**
- **Conclusion**
  - Summarizing the skills and knowledge gained.
  - Additional resources for further learning.
- **Appendix**
  - Common issues and troubleshooting tips.
  - Reference links and additional reading materials.

## Step-by-Step Guide

### Introduction

- **Objective:** Understand Kubernetes' role in deploying and managing multi-tier web applications, using the ReviewBook application as a case study.
- **Overview of the ReviewBook Application:** Explain the architecture of the ReviewBook application, including its front-end, Redis master, and Redis slave components.

### Step Zero: Prerequisites

- **DigitalOcean Account Setup:** Ensure your DigitalOcean account is active. Sign up at DigitalOcean if needed.
- **Install kubectl:** Follow the official Kubernetes installation guide to install kubectl.
- **Install doctl:** Download and install doctl from the DigitalOcean GitHub repository.
- **Clone the Git repo for the lab:** `git clone https://github.com/dxnkramer/k8-reviewbook-go`

### Step One: Creating the Kubernetes Cluster on DigitalOcean

- **Create a DigitalOcean API Token:**
  - Log in to the DigitalOcean Control Panel.
  - Navigate to the API section in the main navigation.
  - Click the "Generate New Token" button.
  - Fill out the fields in the new personal access token window.
  - Record the new token.

- **Authorize doctl:**
  - Use the API token to grant doctl access to your DigitalOcean account.
  - Run `doctl auth init` and pass in the token string.

- **Create the Kubernetes Cluster:**
  - Use doctl to create your Kubernetes cluster.
  - Example command: `doctl kubernetes cluster create reviewbook-cluster --region lon1 --size s-1vcpu-2gb`
  - Configure kubectl to interact with your cluster.

- **Verify the Cluster:**
  - Verify your cluster is active using `kubectl get nodes`.

### Step Two: Creating the Redis Master Pod

- **Deployment:**
  - Use `redis-master-controller.yaml` to create a replication controller and master Redis pod.
  - Run `kubectl create -f <path to redis-master-controller.yaml>`

- **Verification:**
  - Verify the Redis-master controller using `kubectl get rc`.
  - Check the Redis master pod using `kubectl get pods`.

### Step Three: Creating the Redis Master Service

- **Service Creation:**
  - Use `redis-master-service.yaml` to create the master replication controller.
  - Run `kubectl create -f <path to redis-master-service.yaml>`

- **Verification:**
  - Verify the Redis-master service using `kubectl get services`.

### Step Four: Creating the Redis Replica Pods

- **Deployment:**
  - Use `redis-replica-controller.yaml` to create the replication controller.
  - Run `kubectl create -f <path to redis-replica-controller.yaml>`

- **Verification:**
  - Verify the Redis master and replica pods using `kubectl get pods`.

### Step Five: Creating the Redis Replica Service

- **Service Creation:**
  - Use `redis-replica-service.yaml` to create the redis replica service.
  - Run `kubectl create -f <path to redis-replica-service.yaml>`

- **Verification:**
  - Verify the Redis replica service using `kubectl get services`.

### Step Six: Creating the ReviewBook Pods

- **Custom Docker Image:**
  - The ReviewBook application uses a custom Docker image hosted on Docker Hub at `dxnkramer/k8:latest`.

- **Deployment:**
  - Use `ReviewBook-controller.yaml` to create the review book replication controller.
  - Run `kubectl create -f <path to reviewbook-controller.yaml>`

- **Verification:**
  - Verify the reviewbook replication controller and pods using `kubectl get rc` and `kubectl get pods`.

### Step Seven: Creating the ReviewBook Service

- **Service Creation:**
  - Use `reviewbook-service.yaml` to create the review book service.
  - Run `kubectl create -f <path to reviewbook-service.yaml>`

- **Verification:**
  - Verify the ReviewBook service using `kubectl get services`.

### Step Eight: Interacting with the ReviewBook

- **Accessing the Application:**
  - Navigate to `http://external-ip-address:3000` to interact with the ReviewBook application.
  - Find the external IP address using `kubectl get services`.

### Step Nine: Cleanup and Destroy

- **Cleanup:**
  - Run `kubectl delete -f .` and `doctl kubernetes cluster delete <Cluster-Name>` to destroy all resources.
  - Confirm the cleanup in the DigitalOcean control panel.

## Conclusion

- Summarize the skills and knowledge gained from this lab.
- Explore additional resources for further learning.

## Appendix

- Common issues and troubleshooting tips.
- Reference links and additional reading materials.
