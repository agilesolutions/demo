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
          def customImage = docker.build("katacodarob/demo:${env.BUILD_ID}")
          testImage.inside {
             sh '/opt/jboss/wildfly/bin/standalone.sh'
          }
        }
        
      }
    }
  }
}
