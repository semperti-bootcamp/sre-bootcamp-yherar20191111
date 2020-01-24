#!groovy


def manifest

pipeline {
    agent { node { label 'bc-yherar' } }
    
     environment {
     registry = "yherar10/bootcamp"
     registryCredential = "dockerhub"
     VERSION = "9.2"    
 
    }
  
  stages {
	  stage('environment staging') {
	      steps {
                script {
                    manifest = readJSON file: 'manifest.json'
                    echo "deploying environment staging ${manifest.environment_sg.version_sg} to Staging"
                    echo "deploying app artifact, name app ${manifest.app_sg.name_sg}" 
	            echo "Staging host ${manifest.app_sg.ip_sg}"
		    echo "port Staging ${manifest.app_sg.port_sg}"
	            echo "features data_base ${manifest.data_base_sg.ip_db_sg}"
	            echo "por data base app ${manifest.data_base_sg.port_db_sg}"
                }
            }
        }
        
	  stage('Deploy staging') {
              when { 
		environment name: ".environment_sg", value: "YES"
		
		steps {
		    script {
		  manifest = readJSON file: 'manifest.json'
	          echo " ${manifest.environment_sg.version_sg} to Staging"
		  echo "deploy staging if there is a change"
		  sh "git diff HEAD manifest.json"
		  // there are no changes
                  sh "docker pull yherar10/bootcamp:bc-cd"
                  sh "docker run -d --name staging-1 -p 8080:8080  staging:test"
              } 
            }
          }
	    
	  stage('environment prod') {
	      steps {
                script {
                    manifest = readJSON file: 'manifest.json'
                    echo "deploying environment staging ${manifest.environment_pd.version_pd} to prd"
                    echo "deploying app artifact, name app ${manifest.app_pd.name_pd}" 
	            echo "prod host ${manifest.app_pd.ip_pd}"
		    echo "port Staging ${manifest.app_pd.port_pd}"
	            echo "features data_base ${manifest.data_base_pd.ip_db_pd}"
	            echo "port data base app ${manifest.data_base_pd.port_db_pd}"
                }
            }
        }
	  
	   stage('Deploy prod') {
           when { changelog '.*^\\[manifest.json\\] .+$' }
		
		steps {
		    script {
		  manifest = readJSON file: 'manifest.json'
	          echo " ${manifest.environment_pd.version_pd} to Staging"
		  echo "deploy staging if there is a change"
		  sh "git diff HEAD manifest.json"
		  // there are no changes
                  sh "docker pull yherar10/bootcamp:bc-cd"
                  sh "docker run -d --name prd-1 -p 9090:8080  staging:test"
              } 
            }
          }
	  
        stage('curl app') {
          steps {
                  timeout(time: 2, unit: 'MINUTES') {
                    retry(100) {
                        sh 'curl http://10.252.7.84:9090/'
                     }
                   }
                 }
               }
             }
           }
           
