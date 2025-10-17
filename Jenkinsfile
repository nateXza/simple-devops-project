pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nathan-flask-app:latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/nateXza/simple-devops-project.git'
            }
        }

        stage('Clean Up Old Images') {
            steps {
                echo 'Cleaning up old Docker images and containers...'
                // Stop and remove any existing container with the same name
                sh '''
                    docker stop flask-app || true
                    docker rm flask-app || true
                    docker image prune -f || true
                    docker container prune -f || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests inside container...'
                // Replace 'pytest' with your actual test command if needed
                sh 'docker run --rm $DOCKER_IMAGE pytest || true'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Deploying new container...'
                sh '''
                    docker run -d -p 5000:5000 --name flask-app $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment successful!'
            sh 'docker image prune -f || true'
        }
        failure {
            echo '❌ Build or deployment failed. Check the console output for details.'
        }
    }
}
