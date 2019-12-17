pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                    
                  sh "mvn clean --file Code/pom.xml"
                  sh "echo clean"  
            }
          }
       }
    }
