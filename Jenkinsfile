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
                 expression { params.REQUESTED_ACTION == 'false' } 
                   }         
              
             steps {          
                    
                    sh "mvn versions:set -DnewVersion=10.2 --file Code/pom.xml"                
                    sh "mvn clean deploy --file Code/pom.xml"
                   
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
             withDockerRegistry([ credentialsId: "valentia29511208", url: "https://hub.docker.com/repository/docker/yherar10/bootcamp" ]) {
             sh "docker push docker.io/yherar10/bootcamp:bc-ci-2.0"
          
               }
           }
       }
    } 
  }        
                    
   
                     
        
                 
