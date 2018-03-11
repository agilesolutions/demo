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
          def customImage = docker.build("demo:${env.BUILD_ID}")
          //customImage.inside {
          //   sh '/opt/jboss/wildfly/bin/standalone.sh'
          //}
          customImage.withRun('-p 8180:8080') {
            sh 'ls' 
          }
        }        
      }
    }
  }
}
