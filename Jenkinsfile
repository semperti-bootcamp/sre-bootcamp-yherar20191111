pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                     
                  sh "mvn clean /home/yherar/workspace/bc-yherar/CI/Code/pom.xml"
                  
            }
          }
       }
    }
