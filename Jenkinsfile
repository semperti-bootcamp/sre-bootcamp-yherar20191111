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
		            echo "Deploying the manifest ${manifest.version} for ${manifest.artifacts.web} to Staging"
		            echo "URL: ${environment.app.healthcheck_url}"
        }                 
      }
    }
  }
}
