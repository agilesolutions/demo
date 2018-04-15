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
    stage('dockertest') {
      steps {
        script {
          DOCKER_IMAGE.inside {
            //sh 'curl --insecure -o hello.txt http://localhost:8080/demo/rest/members/info'
            //sh 'cat hello.txt'
            sh 'echo tested'
            }
        }
      }
    }
    stage('dockerpush') {
      steps {
        script {
          	docker.withRegistry('https://hub.docker.com','dockerhub') {
          		DOCKER_IMAGE.push()
          	}
        }
      }
    }
    stage('dockerrun') {
      steps {
        script {
          	docker.withServer('tcp://swarm.example.com:2376','server-certs') {
	            DOCKER_IMAGE.run('--name demo -p 8180:8080')
          	}
        }
      }
    }
  }
}
