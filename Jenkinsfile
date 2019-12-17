pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                  sh "mvn clean install /home/yherar/workspace/bc-yherar/CI-bc/Code/"
            }
          }
       }
    }
