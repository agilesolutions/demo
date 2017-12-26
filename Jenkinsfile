pipeline {
	agent any
	tools {
		maven 'apache-maven-3.0.1'
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