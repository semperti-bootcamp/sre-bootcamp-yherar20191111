pipeline {
    agent { node { label 'bc-yherar' } }
    
     environment {
     registry = "yherar10/bootcamp"
     registryCredential = "dockerhub"
     VERSION = "9.2"
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
                      sh "mvn versions:set -DnewVersion=$env.VERSION-SNAPSHOT --file Code/pom.xml"
                      sh "mvn clean deploy -f Code/pom.xml -DskipTests" 
                   }
                }  
          
        stage('release deploy') {        
             steps {          
                    sh "mvn versions:set -DnewVersion=$env.VERSION --file Code/pom.xml"
                    sh "mvn clean deploy --file  Code/pom.xml -DskipTests" 
                } 
              }

         
        stage('delete unused image') {
           steps {  
                  sh "docker ps"
                  sh "docker images"
                  sh "docker image prune -a -f"
               }
             } 
        
        stage('build image docker more tag') {
           steps { 
                   sh "docker build --no-cache -t bc-cd  ."
                   sh "docker images"
                   sh "docker tag  4302dd5b2e85 docker.io/yherar10/bootcamp:bc-cd"          
                 }           
              }      
    
        stage('run new image') {
           steps {
                  sh "docker pull yherar10/bootcamp:bc-ci-2.0"
                  sh "docker run -d -p 8080:8080 docker.io/yherar10/bootcamp:bc-cd"
            }
          }
        
         stage('docker push') {
            steps { 
              script {
               docker.withRegistry( '', registryCredential ) {
                  sh "docker push docker.io/yherar10/bootcamp:bc-cd"             
             } 
           }
         }
       }
      
        stage('curl app') {
          steps {
                  timeout(time: 2, unit: 'MINUTES') {
                    retry(100) {
                        sh 'curl http://10.252.7.84:8080/'
                     }
                   }
                 }
               }
             } 
           }
