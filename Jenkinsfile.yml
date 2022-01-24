pipeline {
    agent none
    stages {    
            stage('cloner repos') {
                 agent any
                    steps {
                         script {
                             sh 'git clone https://github.com/SabrinaDib/PetClinic.git'
                            }
                        }
            }
}
}
