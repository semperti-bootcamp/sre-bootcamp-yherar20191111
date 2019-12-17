pipeline {
    agent { node { label 'bc-yherar' } }

           stage('Test') {
          	  steps {
                	sh 'mvn test'
            	}
            	post {
                	always {
                    	junit '/home/yherar/sre-bootcamp-yherar-11-11-2019/Code/'
                 }
             }
         }
                  
     }
         
      
   
