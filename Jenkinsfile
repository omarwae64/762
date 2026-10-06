pipeline {
    agent{
        label 'docker'
    }
    stages {
        stage('Build Docker images') {
            steps {
                script {
                    sh 'docker build -t omarwael/docker-react -f Dockerfile.dev .'
                }
            }
        }
        stage('Run Tests'){
                steps {
                    script{
                        env.DOCKER_BUILDKIT = 1
                        sh 'docker run -e CI=true omarwael/docker-react npm test '
                    }
                }
        }
    }
}