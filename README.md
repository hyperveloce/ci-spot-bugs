# Minimal Alpine CI Container with SpotBugs

This repository provides a lightweight Alpine-based Docker container with [SpotBugs](https://spotbugs.github.io/) preinstalled. It's ideal for running static analysis on compiled Java classes as part of a CI pipeline.

---

## 📦 Requirements

- Docker
- Your Java project must already be compiled (i.e., `.class` files or a `.jar` file must exist)

---

## 🚀 Getting Started

### 1. Build the Docker Image

```bash
docker build -t alpine-spotbugs .
```

### 2. Run the Container
Mount your Java project's directory into the container so SpotBugs can scan your compiled code.

```bash
docker run -it --rm -v "$PWD":/app alpine-spotbugs
```

Replace $PWD with the path to your Java project if you're not in the root.

### 3. Run SpotBugs
Inside the container Analyze a compiled class directory

```bash
cd /app
spotbugs -textui target/classes
```
