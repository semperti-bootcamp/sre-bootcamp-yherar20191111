## 7.--Docker-Nexus

# Descripción:
 
    1.-La imagen de Docker debe quedar accesible desde Nexus
    2.-Se debe proveer el comando para subir una imagen a Nexus junto con un comando para descargar la imagen y correr el contenedor
    3.-Debe proveerse el sistema lógico de taggeo de imágenes


# Subir Docker Image a Nexus:

  1.- Se creo en dockerhub el repositorio publico “bootcamp”
  
  2.- Nos logueamos en docker hub en nuestra terminal y colocamos las credenciales:
   
        docker login
	
        Username: <username-dockerhub>
        Password: <password-dockerhub>
        Login Succeeded


  3.-  Tag a la Imagen:
   
   - usamos el comando docker tag: 
   - ID de la imagen:                                           (e0b80668a18f) 
   - extension:                                                 (docker.io)
   - usuario de dockerhub:                                      (yherar10)
   - repositorio:                                               (bootcamp)
   - tag:                                                       (app-java-v-1.0)
	

	docker tag  e0b80668a18f docker.io/yherar10/bootcamp:app-java-v-1.0
       
      
   4.- Hacemos docker push a nuestro repositorio:
   
       docker push docker.io/yherar10/bootcamp:app-java-v-1.0
      
       [root@prod-ocp-nodo3 sre-bootcamp-yherar-11-11-2019]# docker push
       docker.io/yherar10/bootcamp:app-java-v-1.0   
       The push refers to a repository [docker.io/yherar10/bootcamp]
       e6f418d9027e: Pushed 
       6954dd0dea7d: Pushed 
       38fddee50e0e: Pushed 
       ceaf9e1ebef5: Pushed 
       9b9b7f3d56a0: Pushed 
       f1b5933fe4b5: Pushed 
       app-java-v-1.0: digest:
       sha256:1ba0be141a8c342051a75696385d0bbcf649878b3811d18c83f9a64c7c855f6a size: 1577
       
 - Para descargar la imagen:
   
       docker pull yherar10/bootcamp:app-java-v-1.0
       
 - Para correr la imagen: 
  
       docker run -d -p 8080:8080 --network=host docker.io/yherar10/bootcamp:app-java-v-1.0 
       
  Link del repositorio dockerhub:
  
  https://hub.docker.com/r/yherar10/bootcamp/tags  

