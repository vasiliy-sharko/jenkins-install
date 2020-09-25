pipeline {
    agent any
    environment {
        COMMIT_ID="""${sh(returnStdout: true, script: 'git rev-parse --short HEAD')}"""
        app = ''
    }
    stages {
        stage('Build') {
            steps {
                app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run -t ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
        
        stage('Push') {
            steps {
                docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                    app.push("${env.BUILD_ID}-${COMMIT}")                
                }
            }
        }
    }

}
