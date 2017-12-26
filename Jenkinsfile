pipeline {
	agent any
	tools {
		maven 'apache-maven-3.3.3'
		jdk 'java'
	}
	stages {
		stage('Build') {
			steps {
				sh 'mvn clean install'
			}
		}
	}
}