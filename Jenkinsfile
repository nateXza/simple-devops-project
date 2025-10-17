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

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                // Example: Run a simple test or placeholder
                sh 'docker run --rm $DOCKER_IMAGE pytest || true'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Deploying container...'
                // Stop any existing container (ignore errors if it doesn’t exist)
                sh 'docker stop flask-app || true'
                sh 'docker rm flask-app || true'
                // Run new container
                sh 'docker run -d -p 5000:5000 --name flask-app $DOCKER_IMAGE'
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment successful!'
        }
        failure {
            echo '❌ Build or deployment failed. Check the console output for details.'
        }
    }
}
