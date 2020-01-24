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
            	    
       stage('clean and unit test') {
            steps {
                   sh "mvn -B clean --file Code/pom.xml"
                   sh "mvn  test --file Code/pom.xml"
                  }
               }
        
       stage('snapshot deploy') {
             steps {  
		 script{
		       // new version staging
		       manifest = readJSON file: 'manifest.json'
		       echo "generate new version staging ${manifest.environment_sg.version_sg}"
                       sh "mvn versions:set -DnewVersion=$env.VERSION-SNAPSHOT --file Code/pom.xml"
                       sh "mvn clean deploy --file Code/pom.xml -DskipTests"
                   }
                } 
             } 
          
        stage('release deploy') {        
             steps { 
		 script {
	            // new version release 
                    manifest = readJSON file: 'manifest.json'
		    echo "generate new version release ${manifest.environment_pd.version_pd}"
                    sh "mvn versions:set -DnewVersion=$env.VERSION --file Code/pom.xml"
                    sh "mvn clean deploy --file  Code/pom.xml -DskipTests" 
                } 
              }
	    }		
	 
	  stage('docker cleaning'){
	  steps {
	          sh '''#!/bin/bash
		  //stop old conatiner
		  docker stop $(docker ps -q)
		  //delete inused images
		  docker images
		  docker image prune -a -f
		        '''
	             } 
	           }		  

       stage('build environments') {
           steps { 
		script {
	           docker.withRegistry( '', registryCredential ) {
                   sh "docker build -t staging ."
                   sh "docker images"
                   sh "docker tag  staging docker.io/yherar10/bootcamp:staging" 
		   sh "docker build -t prod ."
		   sh "docker images"
		   sh "docker tag staging docker.io/yherar10/bootcamp:prod"
                 }           
              }
	   }
         }
            
        stage('docker push') {
            steps { 
              script {
               docker.withRegistry( '', registryCredential ) {
                  sh "docker push docker.io/yherar10/bootcamp:staging"  
		  sh "docker push docker.io/yherar10/bootcamp:prod"
             } 
           }
         }
       }
	   
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
        	steps {
		    script {
		  manifest = readJSON file: 'manifest.json'
	          echo " ${manifest.environment_sg.version_sg} to Staging"
		  echo "deploy staging if there is a change"
		  sh "git diff HEAD manifest.json"
		  // there are no changes
                  sh "docker pull yherar10/bootcamp:bc-cd"
                  sh "docker run -d --name staging-1 -p 8080:8080  staging"
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
           
		
		steps {
		    script {
		  manifest = readJSON file: 'manifest.json'
	          echo " ${manifest.environment_pd.version_pd} to Staging"
		  echo "deploy staging if there is a change"
		  sh "git diff HEAD manifest.json"
		  // there are no changes
                  sh "docker pull yherar10/bootcamp:bc-cd"
                  sh "docker run -d --name prod-1 -p 9090:8080 prod3"
              } 
            }
          }
	  
        stage('curl staging') {
          steps {
                  timeout(time: 2, unit: 'MINUTES') {
                    retry(100) {
                        sh 'curl http://10.252.7.84:8080/'
		    }
		  }
	        }
	      }	
	 		    
         stage('curl prod') {
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
        
