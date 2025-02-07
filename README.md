# **Docker Compose Setup for AI & Web UI Services**

This Docker Compose file orchestrates a comprehensive suite of services designed to power an advanced AI environment, including text and image generation models. It integrates Ollama, Chroma DB, Stable Diffusion Web UI, and Open Web UI, offering both CPU and GPU configurations to match your hardware capabilities.

### **Services Overview**

<div align="center">
  <table>
    <tr><td><b>Open Web UI</b></td><td>A modern interface for AI interactions (port 3000). Features include chat with AI models, built-in speech-to-text via Whisper, RAG capabilities, and image generation integration.</td>
    <td><a href="https://github.com/open-webui/open-webui">open-webui/open-webui</a></td></tr>
    <tr><td><b>Ollama</b></td><td>High-performance AI model server (port 11434) for text generation and embeddings, preconfigured with llama3.3 for chat and nomic-embed-text for RAG functionality.</td>
    <td><a href="https://github.com/ollama/ollama">ollama/ollama</a></td></tr>
    <tr><td><b>Chroma DB</b></td><td>Modern vector database (port 8888) designed for storing and retrieving embeddings, enabling semantic search and RAG capabilities.</td>
    <td><a href="https://github.com/chroma-core/chroma">chroma-core/chroma</a></td></tr>
    <tr><td><b>Stable Diffusion Web UI</b></td><td>Advanced image generation service (port 7860) with support for multiple models, featuring both CPU and GPU optimized configurations.</td>
    <td><a href="https://github.com/AUTOMATIC1111/stable-diffusion-webui">AUTOMATIC1111/stable-diffusion-webui</a></td></tr>
  </table>
</div>

### **Running the Docker Compose Setup**

To start all services, ensure Docker and Docker Compose are installed on your system, then choose one of these commands based on your hardware:

For GPU systems (requires NVIDIA GPU):

```bash
docker compose --profile gpu up -d
```

For CPU-only systems:

```bash
docker compose --profile cpu up -d
```

### **Service Configuration**

#### Open Web UI

- Port: 3000
- Features:
  - Integrated image generation via Stable Diffusion
  - RAG capabilities using Chroma DB
  - Multi-language support (default: English)
  - User signup enabled
- Environment settings:
  - Custom WebUI name: "Awesome ChatBot"
  - Image generation model: v1-5-pruned-emaonly
  - Default image size: 640x800

#### Ollama

- Port: 11434
- Pre-configured models:
  - llama3.3
  - nomic-embed-text
- Persistent storage in `./ollama_storage`

#### Chroma DB

- Port: 8888
- Features:
  - Persistent storage enabled
  - Health monitoring
- Storage location: `./chroma-storage`

#### Stable Diffusion Web UI

- Port: 7860
- Configurations:
  - CPU mode: Optimized for CPU usage with full precision
  - GPU mode: Configured with medvram and xformers optimizations
- Volume mounts:
  - Models: `./sd-webui/models`
  - Outputs: `./sd-webui/output`
  - Extensions: `./sd-webui/extensions`
  - Configuration: `./sd-webui/config`

### **Accessing Services**

After startup, services are available at:

- Open Web UI: `http://localhost:3000`
- Stable Diffusion Web UI: `http://localhost:7860`
- Ollama API: `http://localhost:11434`
- Chroma DB: `http://localhost:8888`

### **Storage Locations**

All services use persistent storage:

- Open Web UI data: `./open-webui`
- Ollama models: `./ollama_storage`
- Chroma DB data: `./chroma-storage`
- Stable Diffusion files:
  - Models: `./sd-webui/models`
  - Outputs: `./sd-webui/output`
  - Config: `./sd-webui/config`
  - Extensions: `./sd-webui/extensions`

### **Notes on GPU Usage**

The GPU profile requires:

- NVIDIA GPU
- Properly installed NVIDIA drivers
- nvidia-docker runtime

All GPU-enabled services are configured to use one GPU by default. This can be adjusted in the docker-compose.yml file if needed.
