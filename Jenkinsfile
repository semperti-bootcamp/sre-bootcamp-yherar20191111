pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        
       stage('Limpieza y unit test') {
            steps {

                   sh "mvn -B clean --file Code/pom.xml"
                   sh "mvn  test --file Code/pom.xml"

                  }
         
               }
        
       stage('snapshot y deploy a nexus') {
             steps {  
           
                    sh "mvn clean package --file Code/pom.xml"
                    sh "mvn versions:set -DnewVersion=10.1-SNAPSHOT --file Code/pom.xml"
                    sh "mvn  deploy --file Code/pom.xml"
                
                    }
              
                 }        
       stage('releases y deploy a nexus') {
             steps {  
        
                    sh "mvn versions:set -DnewVersion=10.2 --file Code/pom.xml --file Code/pom.xml"  
                    sh "mvn clean deploy release:clean release:prepare release:perform --file Code/pom.xml"
                 
                   }
                
                 } 
        
       stage('Deliver') { 
            steps {
               
                    sh './jenkins/scripts/deliver.sh'
                   
                   }
               
                 }
        
       }
   }
    
     
    

         
                         
