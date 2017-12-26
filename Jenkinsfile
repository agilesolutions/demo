pipeline {
	agent any
	tools {
		maven 'maven-3.3.3'
		jdk 'jdk1.8'
	}
	stages {
		stage('Build') {
			steps {
				bat 'mvn clean install'
			}
		}
		stage('Package') {
			steps {
				script {
					docker.withServer('tcp://localhost:2376') {
				   	def customImage = docker.build("my-image:${env.BUILD_ID}")
					}
				}
			}
		}
	}
}