def manifest
def environment

pipeline {
    agent { node { label 'bc-yherar' } }
	
stages {
        stage('Deploy staging') {
            steps {
                 script {
                    manifest = readJSON file: 'manifest.json'
                 }
               }
             }
           }
         }  
                
