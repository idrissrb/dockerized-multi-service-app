![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker\&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js\&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql\&logoColor=white)
![Express](https://img.shields.io/badge/Express-000000?logo=express\&logoColor=white)

# Multi-Service Web Application with Docker & Docker Compose

This project is a **production-like multi-service environment** built using **Docker** and **Docker Compose**, designed to simulate a real DevOps micro-infrastructure. It includes:

* A **Node.js web application**
* A **PostgreSQL** database
* **Adminer**, a web-based database management tool
* An optimized **multi-stage Dockerfile**
* **Named Docker volumes** for persistent storage
* **Healthchecks** and **restart policies** for reliability
* **Multiple Docker networks** for service isolation

---

## 🚀 Features

* Multi-stage Dockerfile (builder + runtime)
* Separate Docker networks for secure service isolation
* Persistent PostgreSQL storage via named volumes
* Adminer UI for database interaction
* Healthchecks for `web_app` and `postgres_db`
* `.env` file support for environment configuration
* Automatic container restarts via Docker policies

---

## 🏗 Architecture

```
            +------------------------+
            |      Adminer (UI)      |
            |      Port: 8080        |
            |  Networks: adminer_net |
            |            backend     |
            +-----------+------------+
                        |
                        v
         +----------------------------------------+
         |                 backend                 |
         |                                          |
   +------------+                         +------------------+
   |  web_app   |  <------ network ------> |  postgres_db     |
   | Port: 3000 |                         | Port: 5432        |
   +------------+                         +------------------+
```

---

## 📦 Services (docker-compose)

* **web** → Node.js application (Express)
* **db** → PostgreSQL 15 database
* **adminer** → Web-based DB management UI

---

## 🛠 How to Run the Project

### 1️⃣ Create a `.env` file

Add the following variables:

```
PORT=3000
DB_HOST=db
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=myappdb
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=myappdb
```

### 2️⃣ Build & Start the Full Stack

```
docker-compose up --build
```

### 3️⃣ Access the Services

* **Web App:** [http://localhost:3000](http://localhost:3000)
* **Health Check:** [http://localhost:3000/health](http://localhost:3000/health)
* **Adminer:** [http://localhost:8080](http://localhost:8080)

### 4️⃣ Adminer Login Credentials

| Field    | Value      |
| -------- | ---------- |
| System   | PostgreSQL |
| Server   | db         |
| Username | postgres   |
| Password | postgres   |
| Database | myappdb    |

---

## 📁 Project Structure

```
multi-service-webapp-docker/
│
├── src/
│   └── server.js
├── Dockerfile
├── docker-compose.yml
├── .env
├── package.json
└── README.md
```

---

## 🧪 Healthchecks

### Web App Healthcheck

* Uses `curl` to check the `/health` endpoint

### PostgreSQL Healthcheck

* Uses `pg_isready` to verify that the DB is accepting connections

---

## 🧹 Clean Up

To remove containers and volumes:

```
docker-compose down -v
```

To clean unused Docker objects:

```
docker system prune -af
```

## 📜 License

MIT License.

