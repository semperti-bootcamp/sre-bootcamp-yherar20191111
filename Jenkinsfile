pipeline {
    agent { node { label 'bc-yherar' } }
    
stages {

      stage('test') {
	  steps {
		  sh "echo test"
	        }
             }
		
        stage('staiging') {
            steps {
		    script {
            	     manifest = readJSON file: 'manifest.json'
			    nvironment = readJSON file: 'test.json'		            
                          }                  
                        }
                      }
                    }
                  }
