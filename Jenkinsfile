pipeline {
    agent any
    stages {    
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
