
# GitHub Runner and Terraform Docker Image

This Docker image is based on Ubuntu 20.04 and includes the following:

- GitHub Actions Runner
- Terraform

## Components

### Base Image

The base image is Ubuntu 20.04.

### GitHub Actions Runner

The GitHub Actions Runner is installed and configured in this image. You can specify the version of the runner using the `RUNNER_VERSION` build argument when building the image.

### Terraform

Terraform is also installed in this image. The version of Terraform can be specified using the `TERRAFORM_VERSION` build argument when building the image. The default version is 1.4.6.

### Additional Tools

Additional tools installed include curl, Node.js, wget, unzip, vim, Git, Azure CLI, jq, build-essential, libssl-dev, libffi-dev, Python3, Python3-venv, Python3-dev, and Python3-pip.

## Build

To build the image, use the following command:

```bash
docker buildx build --build-arg RUNNER_VERSION=<runner_version> --build-arg TERRAFORM_VERSION=<terraform_version> --tag <your_username>/ghrunner:v1 .

```bash
docker buildx build --build-arg RUNNER_VERSION=2.304.0 --build-arg TERRAFORM_VERSION=1.4.6 --tag unpluggedkk/ghrunner:v1 .

```

## Usage

To run a container from the image, use the following command:

docker run -d <your_username>/ghrunner:v1
Replace <your_username> with your Docker username.

## Dockerfile

The Dockerfile for this image is included in the repository. Please refer to it for more details.

This README provides a brief overview of the Docker image, including its components and how to build and run the image. You can add more details as necessary.


```bash
docker run --rm -e PAT='' -e GHUSER='unplugged-kk' -e REPO='self-hosted-gh-runner-azure-container-apps' unpluggedkk/ghrunner:v1
```

Replace <runner_version>, <terraform_version>, and <your_username> with the desired GitHub Actions Runner version, Terraform version, and your Docker username, respectively.

