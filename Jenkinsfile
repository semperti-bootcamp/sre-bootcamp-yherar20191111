pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {
                    
                  sh "mvn test --file /home/yherar/workspace/bc-yherar/ci-bc/Code/pom.xml"
                  sh "echo clean"  
            }
          }
       }
    }
