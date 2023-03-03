pipeline {
  agent {
    label 'worker'
  }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      parallel {
        stage('Build Docker Image') {
          steps {
            sh 'cd node && sudo docker build . -t 285451070707.dkr.ecr.us-east-1.amazonaws.com/node-app-project:${BUILD_NUMBER}'
            sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 285451070707.dkr.ecr.us-east-1.amazonaws.com'
            sh 'docker push 285451070707.dkr.ecr.us-east-1.amazonaws.com/node-app-project:${BUILD_NUMBER}'
          }
        }

             }
    }

    stage('Deploy in Docker') {
      steps {
        script {
          sh 'docker container run -itd -p 8081:8081 285451070707.dkr.ecr.us-east-1.amazonaws.com/node-app-project:${BUILD_NUMBER}'
        }

      }
    }
}
  post {
    always {
      deleteDir()
      sh 'sudo docker rmi 285451070707.dkr.ecr.us-east-1.amazonaws.com/node-app-project:${BUILD_NUMBER}'
    }

  }
}