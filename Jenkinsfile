pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/simple-devops-project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("nathan-flask-app")
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 nathan-flask-app'
            }
        }
    }
}
