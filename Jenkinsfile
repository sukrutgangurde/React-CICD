pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sukrutgangurde/React-CICD.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t react-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 5173:5173 react-app'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
