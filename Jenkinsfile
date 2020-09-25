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
            }
        }
        stage('Push') { 
            steps {
                echo 'Starting push stage...' 
            }
        }
    }
}
