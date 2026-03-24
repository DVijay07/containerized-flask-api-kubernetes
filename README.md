# Containerized-Flask-Api-Kubernetes
Flask REST API containerized with Docker and orchestrated on Kubernetes with Deployment and NodePort Service.


![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![Flask](https://img.shields.io/badge/Flask-REST%20API-lightgrey?logo=flask)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestrated-326CE5?logo=kubernetes)

---

## 📌 Project Architecture

```
Python Flask API
      ↓
Docker Container
      ↓
Docker Image → Docker Hub
      ↓
Kubernetes Deployment (replicas: 3)
      ↓
NodePort Service
      ↓
Users
```

---

## 🗂️ Project Structure

```
containerized-flask-api-kubernetes/
├── Layer1_backend.py        # Flask REST API
├── requirements.txt         # Python dependencies
├── Dockerfile               # Docker image instructions
├── Layer3_deployment.yaml   # Kubernetes Deployment config
└── Layer3_service.yaml      # Kubernetes Service config
```

---

## 🔵 Layer 1 — Flask REST API

A simple Python Flask backend API running on port `9000`.

**Endpoint:**
```
GET /api/data
```

**Response:**
```json
{ "message": "Hello from the backend!" }
```

**Run locally:**
```bash
pip install -r requirements.txt
python Layer1_backend.py
```

Test in browser:
```
http://127.0.0.1:9000/api/data
```

---

## 🐳 Layer 2 — Docker (Containerization)

### Dockerfile Flow
```
1. Pull Python 3.10 base image
2. Set working directory → /app
3. Copy requirements.txt → install dependencies
4. Copy application code
5. Run Flask app
```

### Build Docker Image
```bash
docker build -t python-app .
```

### Run Docker Container
```bash
docker run -p 9000:9000 python-app
```

Test API:
```
http://127.0.0.1:9000/api/data
```

### Tag & Push to Docker Hub
```bash
docker tag python-app:latest 9360654006/python-app:latest
docker login
docker push 9360654006/python-app:latest
```

---

## ☸️ Layer 3 — Kubernetes (Orchestration)

### Deploy to Kubernetes
```bash
kubectl apply -f Layer3_deployment.yaml
kubectl apply -f Layer3_service.yaml
```

### Check Running Pods
```bash
kubectl get pods
```

```
NAME                          READY   STATUS
python-app-675999d754-c5c8q   1/1     Running
```

### Check Service
```bash
kubectl get svc
```

```
NAME             TYPE       CLUSTER-IP       PORT(S)
python-service   NodePort   10.104.121.183   80:32106/TCP
```

---

## 🌐 Kubernetes Networking

```
Browser
   ↓
NodeIP:32106      ←  NodePort  (external access)
   ↓
Service:80        ←  Service port
   ↓
Pod:9000          ←  Container port (Flask API)
```

| Layer      | Port  |
|------------|-------|
| API        | 9000  |
| Container  | 9000  |
| Service    | 80    |
| NodePort   | 32106 |

---

## 🛠️ Kubernetes Debugging Commands

```bash
# Check pod logs
kubectl logs <pod-name>

# Port forward to test locally
kubectl port-forward pod/<pod-name> 9000:9000

# Access pod shell
kubectl exec -it <pod-name> -- /bin/sh
```

After port-forward, test API:
```
http://127.0.0.1:9000/api/data
```

---


## 🧰 Tech Stack

| Tool | Purpose |
|------|---------|
| Python 3.10 + Flask | Backend REST API |
| Docker | Containerization |
| Docker Hub | Image Registry |
| Kubernetes | Container Orchestration |

---
