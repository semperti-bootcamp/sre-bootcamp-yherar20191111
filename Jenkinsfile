pipeline {
    agent { node { label 'bc-yherar' } }

    stages {
        stage('Limpiar Versiones') {
            steps {

                  sh "mvn -B clean --file Code/pom.xml"

                  }

    stages {
        stage('test maven') {
            steps {

                  sh "mvn -B test --file Code/pom.xml"

                  }
             }
           }
         }
       }
     }
                         
