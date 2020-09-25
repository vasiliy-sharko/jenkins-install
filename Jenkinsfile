node {
    def app

    stage('Build') {
        app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
    }
    
    stage('Test') {
        sh 'docker run -t ${IMAGE_NAME}:${IMAGE_TAG}'
    }

    stage('Push') {
        sh 'export COMMIT=$(git rev-parse --short HEAD)'
        sh 'printenv'
        docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
            app.push("${env.BUILD_ID}-${COMMIT}")
        }
    }
}
