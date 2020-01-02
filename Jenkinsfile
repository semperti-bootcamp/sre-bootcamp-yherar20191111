def manifest
def environment

pipeline {
    agent { node { label 'bc-yherar' } }
	
stages {
	steps {
            tage('Deploy to Staging') {
            when {
            branch 'staging' 
            	}
            	steps {
                	script {
                    	manifest = readJSON file: 'manifest.json'
                          }                  
                        }
                      }
                    }
                  }
                 } 
