pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
                docker { image 'maven:3-alpine' }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('dockerbuild') {
      steps {
        script {
          def customImage = docker.build("my-image:${env.BUILD_ID}")
        }
        
      }
    }
  }
}
