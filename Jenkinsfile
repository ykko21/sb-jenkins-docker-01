pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    stages {
        stage("Build Maven Project") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ykko21/sb-jenkins-docker-01']]])
                // sh "mvn clean install" // for Linux
                bat "mvn clean install" // for Windows
            }
        }
        stage("Build Docker Image") {
            steps {
                script {
                    bat "docker build -t ykko21/hello ."  //for Windows
                    //sh "docker build -t ykko21/hello ."  //for Linux
                }
            }
        }
        stage("Publish Docker Image to Docker Hub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'ykko21', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                        bat "docker login -u ykko21 -p ${DOCKER_HUB_CREDENTIALS}"
                    }
                    bat "docker push ykko21/hello"
                }
            }
        }
    }
}