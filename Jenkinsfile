pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                    
                  sh "mvn test Code/pom.xml"
                  sh "echo clean"  
            }
          }
       }
    }
