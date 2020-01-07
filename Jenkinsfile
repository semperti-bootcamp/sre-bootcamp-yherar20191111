def manifest
def environment

pipeline {
    agent { node { label 'bc-yherar' } }
	
stages {
       stage('Deploy to Staging') {
            
            steps {
                script {
                    manifest = readJSON file: 'manifest.json'
                    environment = readJSON file: 'staging.json'
                    echo "Deploying the manifest ${manifest.version} to STAGING" 
                    echo "Deploying APP artifact ${manifest.steps} to STAGING host ${environment.api}"
                }
              }
            }
          }
        }  
