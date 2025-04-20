pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'DockerHub'  // Reference to the DockerHub credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clones your Git repository
                git 'https://github.com/irenanidhi/my-ci-app'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('my-ci-app')
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    // Login to DockerHub
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        // This will authenticate using the credentials stored in Jenkins
                    }
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        docker.image('my-ci-app').push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deployment steps, like running the container, or deploying it on your server
                    echo 'Deploying the Docker container...'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}

