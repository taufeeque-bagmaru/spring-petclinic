#!groovy
pipeline {
	agent none
  stages {
  	stage('Maven Install') {
    	agent none {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
  }
}
