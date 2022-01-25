pipeline {
    agent any
    stages {    
        stage('Start pipeline') 
    {
      agent any
      steps 
       {
         echo 'Bonjour starting the pipe line'
         echo ' ----> Stop all docker containers'
         sh 'docker ps -aq  | xargs --no-run-if-empty docker stop'
         echo ' remove all docker containers'
         sh 'docker ps -aq  | xargs --no-run-if-empty docker rm'
       }
    } 
        stage('cloner repos') {
                 agent any
                    steps {
                         script {
                            // Get some code from a GitHub repository
                            git 'https://github.com/SabrinaDib/PetClinic.git'
                            }
                        }
            }
        
        
        agent       { docker { image 'maven:3.8.4-jdk-11'  }     }
    
}
}
