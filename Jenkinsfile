pipeline 
{
  agent none
  environment 
  {
    MYSQL_SERVER_IP_CLOUD = 'azmysqlpetclinic.mysql.database.azure.com'
    MYSQL_USER_CLOUD= 'sabrinapetclinic'
    MYSQL_PASSWD_CLOUD= 'France2019@'
  }
  }
  stages 
  {
    stage('Start pipe line****************************************') 
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
  
    stage('Docker run mysql  ') 
    {
      agent any
      steps 
      {
          echo 'Lancer un conteneur mysql avec docker'
          sh 'docker run --name mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=7058 -e MYSQL_DATABASE=petclinic -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic123 mysql:5.7.8'
          
      }
    }
    
    stage('Docker Maven: tests et package ') 
    {
      agent 
      { 
         docker { image 'maven:3.8.4-jdk-11'  } 
      }
      steps 
      {
          echo 'Building stage'
          sh 'mvn --version'
          
        sh 'mvn clean package -P MySQL'
      }
    }
    
    stage('Generer image docker de l app avec tomcat********************************************')
    {
      agent any
      steps
      {
        echo 'Generating docker image'
        sh 'docker -version'
      }
    }
   stage('Lancer l application avec docker *******************************************')
    {
      agent any
      steps
      {
        echo 'run docker petclinic'
        sh 'docker -version'
      }
    }
    
   
 }
