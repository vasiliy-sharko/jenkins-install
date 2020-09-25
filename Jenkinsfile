pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo 'Starting build stage...'
                sh 'ls -la'
                sh 'docker build -t testing:v1 .'
            }
        }
        stage('Test') { 
            steps {
                echo 'Starting test stage...'
                sh 'docker run -t testing:v1'
            }
        }
        stage('Push') { 
            steps {
                echo 'Starting push stage...'
                withCredentials([usernamePassword(credentialsId: '${DOCKER}')]) {
                    echo '${DOCKER}'
                }
            }
        }
    }
}
