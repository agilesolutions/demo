pipeline {
  agent none
  environment {
    DOCKER_IMAGE = null
  }
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
          DOCKER_IMAGE = docker.build("demo:${env.BUILD_ID}")
        }          
      }
    }
    stage('dockerrun')
    {
      steps
      {
        script {   
          DOCKER_IMAGE.run('--name demo -p 8180:8080') 
        }   
      }
    }
  }
}
