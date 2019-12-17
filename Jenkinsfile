pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                     
                  sh "mvn clean install Code/"
                  junit 'Code/pom.xml' 
            }
          }
       }
    }
