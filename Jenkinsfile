pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'DockerHub'  // Reference to the DockerHub credentials ID
        DOCKER_PATH = '/usr/local/bin/docker'  // Full path to Docker command (adjust if necessary)
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'GitHub', branch: 'main', url: 'https://github.com/irenanidhi/my-ci-app'
            }
        }

        stage('Check Docker Version') {
            steps {
                script {
                    // Verify Docker is available
                    sh "${DOCKER_PATH} --version"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        // Build the Docker image using the full path to the docker command
                        sh "${DOCKER_PATH} build -t my-ci-app ."
                    } catch (Exception e) {
                        error "Docker build failed: ${e.message}"
                    }
                }
            }
        }
    }
}
