pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
          docker {
              image 'maven:3-alpine'
            // do some caching on maven here
              args '-v $HOME/.m2:/root/.m2'
          }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('dockerbuild') {
      steps {
        script {
          def customImage = docker.build("demo:${env.BUILD_ID}")
          customImage.run('--name demo -p 8180:8080')
          //customImage.inside {
          //   sh '/opt/jboss/wildfly/bin/standalone.sh'
          //}
          //customImage.withRun('-p 8180:8080') {
          //  sh 'ls' 
          //}
        }        
      }
    }
  }
}
