pipeline {
    agent any
    stages {    
        stage('Start pipe line') 
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
        
        stage('Build') {
            steps {
                

                // Run Maven on a Unix agent.
                sh "mvn -version"
            }

        }
    
}
}
