pipeline {
 
    stage('Docker run mysql  ') 
    {
      agent any
      steps 
      {
          echo 'Lancer un conteneur mysql avec docker'
          sh 'docker run --name mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=7058 -e MYSQL_DATABASE=petclinic -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic123 mysql:5.7.8'
          
      }
    }
	
	
	agent {
        docker {
            image 'maven:3.8.4-openjdk-11'  
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
				sh 'mvn -Denv.MYSQL_SERVER_IP=${MYSQL_SERVER_IP} -Denv.MYSQL_USER=${MYSQL_USER} -Denv.MYSQL_PASSWD=${MYSQL_PASSWD} clean package -P MySQL'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
    }
}
