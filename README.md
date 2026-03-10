# Web Snake Game

This is a modern, HTML5/Canvas-based Snake Game, refactored from Python's Turtle module so it can be deployed and played on a cloud virtual machine via a web browser!

## Running locally

Just open `web/index.html` in any modern browser!

## Deployment via GitHub Actions to GCP VM

This repository includes a pre-configured GitHub Actions workflow (`.github/workflows/deploy.yml`) that follows best practices by packaging the game as an Nginx Docker container and deploying it to a Google Cloud Platform (GCP) VM.

### Prerequisites on GCP
1. Create a Linux VM (Compute Engine).
2. Ensure **Docker** and **Git** are installed on the VM (`sudo apt install docker.io git`).
3. Add the VM user to the `docker` group (`sudo usermod -aG docker $USER`).
4. Ensure your VM's firewall allows HTTP traffic on **Port 80**.
5. Set up an SSH key pair (or use existing) to connect to the VM.

### GitHub Secrets Configuration
To make the pipeline work automatically when you push to `main`, go to the **Settings > Secrets and variables > Actions** tab of this repository and add the following secrets:

- `GCP_VM_IP`: The external IP address of your VM.
- `GCP_SSH_USER`: The username for the VM.
- `GCP_SSH_KEY`: The **private** SSH key that corresponds to the public key authorized on the VM.

Once these secrets are configured, every commit to the `main` branch will automatically build and deploy the game to your server!
