# 🚀 ELK Stack

This project simulates a website infrastructure with a focus on **log management and analysis** using the **ELK stack** (Elasticsearch, Logstash, Kibana). The goal is to establish a robust system for collecting, processing, storing, and visualizing logs.

---

## 📋 Project Overview

The project is divided into three main components:
1. **Backend**: A Django-based application serving as the backend.
2. **Frontend**: A React-based application serving as the frontend.
3. **Infrastructure**: Dockerized setup for the ELK stack, PostgreSQL database, and Nginx for reverse proxying.

### 🎯 Key Features
- **Elasticsearch**: Efficiently stores and indexes log data.
- **Logstash**: Collects, processes, and transforms log data from various sources.
- **Kibana**: Visualizes log data and provides dashboards for insights.
- **PostgreSQL**: Serves as the primary database for the backend.
- **Nginx**: Acts as a reverse proxy for routing requests to the frontend, backend, and Kibana.

---

## 📂 Directory Structure

```
└── ELK_Stack/
    ├── README.md
    ├── LICENSE
    ├── Makefile
    ├── backend/
    │   ├── Dockerfile
    │   ├── app/
    │   │   ├── manage.py
    │   │   ├── requirements.txt
    │   │   └── base/
    │   │       ├── __init__.py
    │   │       ├── asgi.py
    │   │       ├── settings.py
    │   │       ├── urls.py
    │   │       └── wsgi.py
    │   └── scripts/
    │       └── entrypoint.sh
    ├── frontend/
    │   ├── Dockerfile
    │   ├── .dockerignore
    │   └── app/
    │       ├── README.md
    │       ├── eslint.config.js
    │       ├── index.html
    │       ├── package.json
    │       ├── vite.config.js
    │       ├── .gitignore
    │       ├── public/
    │       └── src/
    │           ├── App.css
    │           ├── App.jsx
    │           ├── index.css
    │           ├── main.jsx
    │           └── assets/
    └── infrastructure/
        ├── docker-compose.yml
        ├── example_env
        ├── .env
        ├── database/
        │   ├── Dockerfile
        │   └── scripts/
        │       └── entrypoint.sh
        ├── elk_setup/
        │   ├── Dockerfile
        │   └── tools/
        │       └── entrypoint.sh
        ├── filebeat/
        │   └── conf/
        │       └── filebeat.yml
        ├── logstash/
        │   └── conf/
        │       └── logstash.conf
        └── nginx/
            ├── Dockerfile
            └── conf/
                └── nginx.conf
```

---

## 🛠️ Setup Instructions

### 🧰 Prerequisites
- **Docker** and **Docker Compose** installed on your machine.
- Basic understanding of Docker, Django, React, and the ELK stack.

### 🚦 Steps to Run the Project

1. **Clone the Repository**
   ```bash
   git clone https://github.com/abizyane/ELK_Stack.git
   cd ELK_Stack
   ```

2. **Set Up Environment Variables**
   - Copy the `example_env` file to `.env` and update the values as needed.
   ```bash
   cp infrastructure/example_env infrastructure/.env
   ```

3. **Build and Start the Services**
   - Use the provided `Makefile` to build and start the services.
   ```bash
   make build
   make up
   ```

4. **Access the Services**
   - **Frontend**: Access via `https://localhost/frontend/`
   - **Backend**: Access via `https://localhost/backend/`
   - **Kibana**: Access via `https://localhost/kibana/`

5. **View Logs in Kibana**
   - Logs from the backend, frontend, and other services will be collected by Filebeat, processed by Logstash, and stored in Elasticsearch. You can visualize these logs in Kibana.

---

### 🛠️ Makefile Commands
| Command       | Description                                      |
|---------------|--------------------------------------------------|
| `make build`  | Build the Docker images.                         |
| `make up`     | Start all services.                              |
| `make down`   | Stop all services.                               |
| `make state`  | Check the state of running services.             |
| `make restart`| Restart all services.                            |
| `make logs`   | View logs from all services.                     |
| `make clean`  | Stop and remove all containers.                  |
| `make fclean` | Clean and remove Docker cache and volumes.       |
| `make dclean` | Full clean, including removing database and ELK data. |
| `make help`   | Display available commands.                      |

---

## 🐘 ELK Stack Configuration

### 🐘 Elasticsearch
- **Purpose**: Stores and indexes log data.
- **Port**: `9200`
- **Access**: Secured with SSL and basic authentication.

### 🚰 Logstash
- **Purpose**: Collects, processes, and transforms log data.
- **Port**: `5044`
- **Configuration**: Defined in `logstash.conf`.

### 📊 Kibana
- **Purpose**: Visualizes log data and provides dashboards.
- **Port**: `5601`
- **Access**: Secured with SSL and basic authentication.

### 📁 Filebeat
- **Purpose**: Collects logs from Docker containers and sends them to Logstash.
- **Configuration**: Defined in `filebeat.yml`.

---

## 🗄️ Data Retention and Archiving
- **ILM Policy**: An Index Lifecycle Management (ILM) policy is defined to manage log data retention. Logs are rolled over after 2 days, moved to cold storage after 3 days, and deleted after 5 days.

---

## 🔒 Security Measures
- **SSL/TLS**: All communication between ELK components is secured with SSL/TLS.
- **Authentication**: Elasticsearch and Kibana are secured with username and password.

---

## 🚨 Troubleshooting
- If services fail to start, check the logs using `make logs`.
- Ensure that all environment variables are correctly set in the `.env` file.
- If Elasticsearch or Kibana fails to start, ensure that the certificates are correctly generated by the `elk_setup` service.

---

## 📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
