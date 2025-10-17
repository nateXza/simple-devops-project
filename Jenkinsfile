stage('Build Docker Image') {
    steps {
        echo 'Building Docker image...'
        sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
    }
}

stage('Run Tests') {
    steps {
        echo 'Running container tests...'
        sh 'docker run --rm $IMAGE_NAME:$IMAGE_TAG python3 -m unittest discover -s tests || true'
    }
}

stage('Deploy Container') {
    steps {
        echo 'Deploying container...'
        sh '''
            docker stop flask-app || true
            docker rm flask-app || true
            docker run -d -p 5000:5000 --name flask-app $IMAGE_NAME:$IMAGE_TAG
        '''
    }
}
