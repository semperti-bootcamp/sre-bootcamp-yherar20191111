pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        
        stage('Limpieza y unit test') {
            steps {

                  sh "mvn -B clean --file Code/pom.xml"
                  sh "mvn  test --file Code/pom.xml"

                  }
             }
           }
         }
     
    
                         
