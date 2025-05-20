# 📦 PHP MySQL Docker App

A minimal PHP application that connects to a MySQL database and displays the contents of a table. Designed for local development using Docker Compose, and structured for scalability and DevOps readiness.

---

## 📁 Project Structure

```
├───.github
│   └───workflows
│           deploy.yml
│
├───docker
│   ├───mysql
│   │       init.sql
│   │
│   └───php
│       │   Dockerfile
│       │
│       └───src
│               index.php
│
└───tests
        app.test.ts
        package.json
        playwright.config.ts
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- Docker
- Docker Compose

### 🛠️ Clone the repo

```bash
git clone https://github.com/yourusername/php-db-app.git
cd php-db-app
````

---

## 🔧 Configuration

For local tests create a `.env.local` file in the root directory (example below):

```dotenv
DB_HOST=db
DB_USER=admin
DB_PASS=password
DB_NAME=name
BASE_URL=http://localhost:8888
```

The default MySQL root password is hardcoded as `root` (for local testing only).

---

## 🐳 Run with Docker Compose

```bash
docker-compose up --build
```

Once running, visit:
👉 [http://localhost:8888](http://localhost:8888)

You should see output like:

```
Hello from Docker!
This is a test row
```

---

## 🧪 Local Database

* **MySQL image**: `mysql:8.0`
* **Port**: `3306`
* **Seed file**: `docker/mysql/init.sql`

---

## 💻 App Overview

The PHP app uses environment variables to connect to the database, and handles:

* Connection errors
* Query errors
* Escaping output (`htmlspecialchars`)

---

## 🧹 Clean Up

```bash
docker-compose down -v
```

This stops containers and deletes the volume (database).

---

## 🧑‍💻 Author

**Panagiotis Karles**
Senior DevOps Engineer
[LinkedIn →](https://linkedin.com/in/pkarles)

---

## 📄 License

MIT (or your preferred license)

```
