node {
    def app

    stage('Build') {
        app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
    }
    
    stage('Test') {
        sh "docker run -t ${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stage('Push') {
        docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
            app.push("${env.BUILD_ID}-${env.GIT_COMMIT.take(7)}")
        }
    }
}
