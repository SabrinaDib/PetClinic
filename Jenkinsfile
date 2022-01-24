pipeline {
    agent any
    stages {    
            stage('cloner repos') {
                 agent any
                    steps {
                         script {
                             echo 'git status'
                            }
                        }
            }
        
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/SabrinaDib/PetClinic.git'

                // Run Maven on a Unix agent.
                sh "mvn -version"
            }

        }
    
}
}
