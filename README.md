# Web Snake Game

This is a modern, HTML5/Canvas-based Snake Game, refactored from Python's Turtle module so it can be deployed and played on a cloud virtual machine via a web browser!

## Running locally

Just open `web/index.html` in any modern browser!

## Deployment via GitHub Actions to GCP VM using Workload Identity Federation

This repository includes a pre-configured GitHub Actions workflow (`.github/workflows/deploy.yml`) that follows enterprise best practices. It uses **Google Cloud Workload Identity Federation (WIF)** to securely authenticate without relying on long-lived SSH keys or service account JSON files.

### Prerequisites on GCP
1. Create a Linux VM (Compute Engine).
2. Ensure **Docker** and **Git** are installed on the VM (`sudo apt install docker.io git`).
3. Ensure your VM's firewall allows HTTP traffic on **Port 80**.
4. Configure Workload Identity Federation for GitHub Actions in your GCP project.
5. Ensure your service account has `roles/compute.osLogin` and `roles/compute.instanceAdmin.v1` to allow SSH via IAP.
6. Enable the **Identity-Aware Proxy (IAP)** API for secure access.

### GitHub Secrets Configuration
Go to the **Settings > Secrets and variables > Actions** tab of this repository and add the following repository secrets to link up with GCP securely:

- `GCP_WORKLOAD_IDENTITY_PROVIDER`: Your full WIF provider string (e.g., `projects/123456789/locations/global/workloadIdentityPools/my-pool/providers/my-provider`).
- `GCP_SERVICE_ACCOUNT`: The service account email that the pipeline will impersonate.
- `GCP_PROJECT_ID`: Your Google Cloud project ID.
- `GCP_VM_NAME`: The name of the VM you want to deploy to.
- `GCP_VM_ZONE`: The zone your VM resides in (e.g., `us-central1-a`).

Once these secrets are configured, every commit to the `main` branch will automatically build and deploy the game to your server!
