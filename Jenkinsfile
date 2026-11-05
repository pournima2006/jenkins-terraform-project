pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/pournima2006/jenkins-terraform-project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t jenkins-demo:1.0 .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker images jenkins-demo:1.0'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stop jenkins-demo || true
                    docker rm jenkins-demo || true
                    docker run -d -p 8080:80 --name jenkins-demo jenkins-demo:1.0
                '''
            }
        }
    }
}
