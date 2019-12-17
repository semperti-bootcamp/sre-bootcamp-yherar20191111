pipeline {
    agent { node { label 'bc-yherar' } }

              stages {
        stage('test app') { 
            steps {
                sh 'mvn test'
        } 
       }
            post {
                always {
                    junit '/home/yherar/sre-bootcamp-yherar-11-11-2019/Code/pom.xml'

          }
       }
    }
 }
