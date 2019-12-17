pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        
        steps ('Limpiar Versiones') {
            steps {

                  sh "mvn -B clean --file Code/pom.xml"

                  }

    
        staps ('test maven') {
            steps {

                  sh "mvn -B test --file Code/pom.xml"

                  }
             }
           }
         }
       }
    
                         
