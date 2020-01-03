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
                    echo "Deploying WEB artifact ${manifest.artifacts.web} to STAGING host ${environment.web.host}"
                    echo "Deploying API artifact ${manifest.artifacts.api} to STAGING host ${environment.api.host}"
                }
              }
            }
          }
        }  
