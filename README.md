## 10.--Gitops:

# Descripción:

         1.-Se debe realizar la configuración de un Manifest en GitHub
         2.-La modificación del Manifest, sólo deberá afectar el ambiente elegido [tiene que haber, al menos, dos ambientes distintos (staging/prod)]
         3.-Debe ejecutarse automáticamente, tras únicamente, la modificación del Manifest y SOLO del ambiente elegido
         
 # Gitops:
 
 1.- Creamos un manifest.jso con las caracteristicas de la aplicacion:
 
                        
         {
          "environment_sg": {
          "version_sg": "9.5"
         },
          "description": "environment for staging using in manifest",
          "app_sg" : {
          "name_sg" : "journals-new",
          "ip_sg"   : "10.252.7.84",
          "port_sg" : "8080"
         },
          "data_base_sg" : {
          "ip_db_sg": "10.252.7.84",
          "port_db_sg" : "3306"
         },
           "environment_pd": {
           "version_pd": "9.6"
         },
          "descrption": "environment for prod using in manifest",
          "app_pd": {
          "name_pd" : "journals-old",
          "ip_pd"   : "10.252.7.84"
         },
          "data_base_pd" : {
          "ip_db_pd": "10.252.7.84",
          "port_db_pd": "3306"
         }
       }       
         
         
