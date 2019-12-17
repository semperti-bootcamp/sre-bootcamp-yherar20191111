pipeline {
    agent  { node { label 'bc-yherar' } }
            stages {
        stage('Construir la aplicacion') { 
            steps {
                sh 'mvn -B  clean package' 
          }
       }
     }
   }
 }
