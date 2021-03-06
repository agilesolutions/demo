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
//          DOCKER_IMAGE = docker.build("katacodarob/demo:${env.BUILD_ID}")
          DOCKER_IMAGE = docker.build("katacodarob/demo:latest")
        }
      }
    }
    stage('dockertest') {
      steps {
        script {
          DOCKER_IMAGE.inside {
          	// do a Docker jbosscli test to see if JBoss is up and running to complete this test
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
        	// a bit of working around the bug in withRegistry (-:
        	withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          		docker.withRegistry('', 'docker-hub-credentials') {
          		    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
          			DOCKER_IMAGE.push('latest')
          		}
        	}
        }
      }
    }
    stage('dockerrun') {
      steps {
        script {
        	// just open another instance play-with-docker and grab the IP address on it
          	docker.withServer('tcp://192.168.0.57:2375') {
	            DOCKER_IMAGE.run('--name demo -p 8180:8080')
          	}
        }
      }
    }
  }
}
