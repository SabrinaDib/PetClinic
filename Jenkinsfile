pipeline {

  environment 
  {
    MYSQL_SERVER_IP = '192.168.0.145'
    MYSQL_USER= 'petclinic'
    MYSQL_PASSWD= 'petclinic123'
    
    MYSQL_SERVER_IP_CLOUD = 'azmysqlpetclinic.mysql.database.azure.com'
    MYSQL_USER_CLOUD= 'sabrinapetclinic'
    MYSQL_PASSWD_CLOUD= 'France2019@'
  }
 
    agent {
        docker {
            image 'maven:3.8.4-openjdk-11'  
        }
    }
    stages {
	/*stage('Docker run mysql  ')*/ 
    
      agent any
      steps 
      {
          echo 'Lancer un conteneur mysql avec docker'
         
          
      }
    
	{
      agent any
      steps
      {
        echo 'Generating docker image'
        sh 'docker build -t petclinic:latest .'
      }
    }
      
        }
        
    }
