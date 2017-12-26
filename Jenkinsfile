pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            bat 'mvn clean install'
            input(message: 'confirm', id: 'confirm', ok: 'natuurlijk', submitter: 'asfd', submitterParameter: 'afsaf')
          }
        }
        stage('echo') {
          steps {
            echo 'dad'
          }
        }
      }
    }
    stage('Package') {
      steps {
        bat 'docker rmi -f my-image:latest && exit 0'
        bat 'docker build -t my-image:latest .'
      }
    }
  }
  tools {
    maven 'maven-3.3.3'
    jdk 'jdk1.8'
  }
}