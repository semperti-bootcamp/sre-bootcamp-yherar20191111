pipeline {
    agent { node { label 'bc-yherar' } }
    
     parameters {
        choice(
            choices: ['true' , 'false'],
            description: '',
            name: 'REQUESTED_ACTION')
                }  

     environment {
     registry = "yherar10/bootcamp"
     registryCredential = "dockerhub"
    }
  
    stages {
        
       stage('Limpieza y unit test') {
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
             when {
                // Ejecuta esta etapa solo cuando este "true"
                 expression { params.REQUESTED_ACTION == 'true' } 
                   }         
              
             steps {          
                    sh "mvn versions:set -DnewVersion=10.2 --file Code/pom.xml"                
                    sh "mvn clean deploy --file Code/pom.xml"
                   }
                } 

       stage('build image docker') {
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
         
        stage('delete unused image') {
         steps {
              
                  sh "docker ps"
                  sh "docker stop 8d01b6a3e424"
                  sh "docker images"
                  sh "docker rmi -f 11a95ec8e08c"
               }
             } 
         
        stage('run new image') {
         steps {
                  sh "docker pull yherar10/bootcamp:bc-ci-2.0"
                  sh "docker run -d -p 8080:8080 --network=host docker.io/yherar10/bootcamp:bc-ci-2.0"
                }
              }
    
        stage('curl app') {
          steps {
                   timeout(time: 1, unit: 'MINUTES')
                   sh "curl http://10.252.7.84:8080/"
                }
              }
            } 
          }  
        
