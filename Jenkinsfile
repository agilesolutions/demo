pipeline {
	agent any
	tools {
		maven 'apache-maven-3.3.3'
		jdk 'jdk1.8'
	}
	stages {
		stage('Build') {
			steps {
				sh 'mvn clean install'
			}
		}
	}
}