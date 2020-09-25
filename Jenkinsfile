pipeline {
    agent any
    environment {
        COMMIT_ID="""${sh(returnStdout: true, script: 'git rev-parse --short HEAD')}"""
        app = ''
    }
    stages {
        stage('Build') {
            app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
        }
        
        stage('Test') {
            sh 'docker run -t ${IMAGE_NAME}:${IMAGE_TAG}'
        }
        
        stage('Push') {
            docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                app.push("${env.BUILD_ID}-${COMMIT}")                
            }        
        }
    }

}
