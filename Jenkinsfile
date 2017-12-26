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
				bat 'docker rmi -f my-image:latest && exit 0'
				bat 'docker build -t my-image:latest .'
			}
		}
	}
}