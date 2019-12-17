pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                  
                  sh "mvn clean"
                  workspace "Code/pom.xml"
            }
          }
       }
    }
