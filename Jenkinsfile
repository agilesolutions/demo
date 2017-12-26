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
	}
}