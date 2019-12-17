pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                    
                  sh "mvn -B clean Code/pom.xml"
                  sh "echo clean"  
            }
          }
       }
    }
