# Civitai Models CLI stand-alone Docker Image

This repository contains the necessary files to build and run a Docker container for the civitai-models-cli. The service is configured using a `Dockerfile` and `docker-compose.yaml`.

> [!IMPORTANT]
> You must first copy or reanme the `docker.env` file to `.env` and make sure to update
> the `MODEL_DIR` variable to the location where you models are stored on yoour host before running any of the docker commands.

> [!NOTE]
> It is recommend that you update the `sample.env` file before running the docker commands. You do not need to rename this file to `.env`, it will be automatically renamed when copied into the container.

## Prerequisites

- Docker
- Docker Compose

## Dockerfile

The `Dockerfile` is used to create a Docker image for the civitai-models-cli. It is based on the `debian:bullseye-slim` image and installs the necessary dependencies, including Python 3 and various Python packages.

### Key Steps in the Dockerfile

1. **Base Image**: Uses `debian:bullseye-slim` as the base image.
2. **System Updates and Cleanup**: Updates the package list and removes unnecessary packages.
3. **Python Installation**: Installs Python 3 and pip.
4. **Environment Variables**: Sets environment variables for locale and PATH.
5. **Python Packages**: Installs required Python packages using pip.
6. **Working Directory**: Sets the working directory to `/home/civitaiuser`.
7. **Copy Files**: Copies the `.env` file and `requirements.txt` to the container.
8. **Install Python Dependencies**: Installs Python dependencies from `requirements.txt`.
9. **User Setup**: Creates a new user `civitaiuser` and switches to this user.
10. **Default Command**: Sets the default command to `bash`.

## Docker Compose

The `docker-compose.yaml` file is used to define and run the civitai-models-cli as a Docker container.

### Key Sections in docker-compose.yaml

- **version**: Specifies the version of Docker Compose.
- **services**: Defines the services to be run.
  - **civitai-service**: The main service.
    - **build**: Specifies the build context.
    - **container_name**: Names the container `civitai-container`.
    - **environment**: Sets environment variables.
    - **volumes**: Mounts the current directory to `/home/civitaiuser` in the container.
    - **working_dir**: Sets the working directory to `/home/civitaiuser`.
    - **command**: Sets the default command to `bash`.

## How to Build and Run

1. **Clone the Repository**:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Build and Run the Docker Container**:
    ```bash
    docker-compose up --build
    ```

3. **Using run.sh (Linux/macOS)**:
    ```bash
    ./run.sh
    ```

4. **Using run.bat (Windows)**:
    ```cmd
    run.bat
    ```

5. **Access the Container**:
    The container will start and you can access it using:
    ```bash
    docker exec -it civitai-container zsh
    ```

## Stopping the Service

To stop the service, run:
```bash
docker-compose down
```

## Additional Information

- **Environment Variables**: Ensure that the `.env` file contains the necessary environment variables for the service.
- **Python Dependencies**: List all required Python packages in `requirements.txt`.
