pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'DockerHub'  // Reference to the DockerHub credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'GitHub', branch: 'main', url: 'https://github.com/irenanidhi/my-ci-app'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        docker.build('my-ci-app')
                    } catch (Exception e) {
                        error "Docker build failed: ${e.message}"
                    }
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        // This will authenticate using the credentials stored in Jenkins
                    }
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        docker.image('my-ci-app').push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the Docker container...'
                    // Add actual deployment steps here
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    sh 'docker system prune -f'
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
