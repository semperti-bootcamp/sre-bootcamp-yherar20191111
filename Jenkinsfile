pipeline {
    agent { node { label 'bc-yherar' } }
    
     environment {
     registry = "yherar10/bootcamp"
     registryCredential = "dockerhub"
     VERSION = "10.5"
    }
  
    stages {
        
       stage('clean and unit test') {
            steps {
                   sh "mvn -B clean --file Code/pom.xml"
                   sh "mvn  test --file Code/pom.xml"
                  }
               }
        
       stage('snapshot deploy') {
             steps {  
                    sh "mvn clean package --file Code/pom.xml"
                    sh "mvn versions:set -DnewVersion=10.1-SNAPSHOT --file Code/pom.xml"
                    sh "mvn  clean deploy --file Code/pom.xml"
                   }
                }  
          
       stage('release deploy') {        
             steps {          
                   sh "mvn versions:set -DnewVersion=$env.VERSION -f Code/pom.xml"
                   sh "mvn clean deploy -f Code/pom.xml -DskipTests" 
              }
            }

       stage('build image docker more tag') {
           steps { 
                   sh "docker build -t bc-ci ."
                   sh "docker images"
                   sh "docker tag  11a95ec8e08c docker.io/yherar10/bootcamp:bc-ci-2.0"          
                 }           
              }
      
        stage('docker push') {
            steps { 
              script {
               docker.withRegistry( '', registryCredential ) {
               sh "docker push docker.io/yherar10/bootcamp:bc-ci-2.0"             
             } 
           }
         }
       } 
     }      
   }

 
