pipeline {
  agent any
	environment {
        //once you create ACR in Azure cloud, use that here
         registryName = "petclinicregitry"
        //- update your credentials ID after creating credentials for connecting to ACR
         registryCredential = 'Petclinic'
		 dockerImage = ''
         registryUrl = 'petclinicregitry.azurecr.io'
                  }
    tools { 
        maven 'M3' 
           }
	stages {      
            stage('build mvn') {
              steps {
                 sh 'mvn clean package'
                     }          }
	        
			stage('cmd docker') {
		       steps{
			      sh 'docker ps'
				    }            }
	        
			        }			

		   stage('test install tomcat'){
		     steps{	
			    sh 'docker build -t petclinic_img .'
		    	sh 'docker run -d -p 8888:8080 --name petclinic petclinic_img'
				 }                      }
     
          stage ('Build Docker image') {
            steps {
            script {
                    dockerImage = docker.build registryName
                }
            }
        }
	    // Uploading Docker images into ACR
         stage('Upload Image to ACR') {
           steps{   
             script {
                 docker.withRegistry( "http://${registryUrl}", registryCredential ) 
				 {
                 dockerImage.push()
                }
        }
      }
    }
	    // Stopping Docker containers for cleaner Docker run
     stage('stop previous containers') {
         steps {
            sh 'docker ps -f name=petclinic -q | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -a -fname=petclinic -q | xargs -r docker container rm'
         }
       }
		
		stage('Docker Run') {
     steps{
         script {
                sh 'docker run -d -p 8096:5000 --rm --name petclinic ${registryUrl}/${registryName}'
            }
      }
    }
	}
	
