pipeline {
    agent { node { label 'bc-yherar' } }
    
     parameters {
        choice(
            choices: ['true' , 'false'],
            description: '',
            name: 'REQUESTED_ACTION')
                }
    
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
                    sh "mvn  clean deploy --file Code/pom.xml"
                
                    }
              
                 }  
          
       stage('release y deploy a nexus') {
             when {
                // Ejecuta esta etapa solo cuando este "true"
                 expression { params.REQUESTED_ACTION == 'true' } 
                   }         
              
             steps {          
                    
                    sh "mvn versions:set -DnewVersion=10.2 --file Code/pom.xml"                
                    sh "mvn clean deploy --file Code/pom.xml"
                   
                  }
                
                } 
        
           }      
        }
      
