pipeline {
    agent 
    stages{
    {    docker { image 'maven:3.8.4-openjdk-11 } 
            }
      stages {
        stage('log version info') {
      steps {
     git 'https://github.com/SabrinaDib/PetClinic.git'
        sh 'mvn --version'
        sh 'mvn clean install'
      }
    }
  }
    }}
