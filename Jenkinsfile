pipeline {
    agent any
    tools { 
        maven 'M3' 
    }

    environment {
	//var ENV ACR
        registryName = "petclinicweb"
        registryCredential = 'Petclinic'
        registryUrl = 'petclinicregitry.azurecr.io'
    // var Env Mysql
	    MYSQL_PASSWORD = 'France2019@'
	    MYSQL_USERNAME = 'azsabrinapetclinic'
	    MYSQL_SERVER_IP = 'azpetclincmysql.mysql.database.azure.com'
		dockerImage = ''
	}	
    stages {       
        stage('build mvn') {
            steps {      
                sh 'mvn clean '        
            }        
        }
     
		stage("build and SonarQube analysis") {
            steps {
					sh 'mvn clean install'
					sh 'mvn clean install package org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
					echo 'mvn -Denv.MYSQL_SERVER_IP=${MYSQL_SERVER_IP} -Denv.MYSQL_USERNAME=${MYSQL_USERNAME} -Denv.MYSQL_PASSWORD=${MYSQL_PASSWORD} package -P MySQL'
					}
                                              }
		 
		stage("Quality Gate") {
            steps {
				timeout(time: 10, unit: 'MINUTES') {
					waitForQualityGate abortPipeline: true
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

		stage('install tomcat in a docker'){
			steps{
				sh 'docker build -t petclinic_imgage .'
				sh 'docker run -d -p 8888:8080 --name petclinic petclinic_imgage'
			}	
		}

        stage ('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build registryName
                }
            }
        }

		stage('Upload Image to ACR') {
			steps{   
				script {
					docker.withRegistry( "http://${registryUrl}", registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
	}
}
