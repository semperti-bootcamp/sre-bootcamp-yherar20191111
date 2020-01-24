## 6.--Docker-app

# Descripción:

    1.-Se debe proveer el Dockerfile y los archivos necesarios para generar la imagen
    2.- Debe quedar corriendo el container
    3.-Debe proveerse un link para probar el funcionamiento del contenedor
      
# Dockerizar la aplicacion: 

  1.- Instalamos docker:
        
      yum install docker
      
  2.- Habilitamos e Iniciamos docker: 
  
      systemctl enable docker
      
      systemctl start docker
      
  3.- Creamos un Dockerfile en la raiz de nuestro proyecto: 
  
      cd /sre-bootcamp-yherar-11-11-2019
      touch Dockerfile
      
 4.- Configuramos el Dockerfile para crear la Imagen:
 
    FROM openjdk:8-alpine
    EXPOSE 8080 3306 9090
    RUN mkdir -p /root/upload
    COPY /PDFs /root/upload/
    ADD http://10.252.7.162:8081/repository/maven-releases/com/semperti/trial/journals/test-1.1/journals-test-1.1.jar     /root/upload/
    CMD ["java","-jar","/root/upload/journals-test-1.1.jar"]
     
  5.- Creamos la imagen y vemos su estado:
  
      docker build --no-cache -t journals-1 .
      docker images
      
      [root@prod-ocp-nodo3 sre-bootcamp-yherar-11-11-2019]# docker images 
      REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
      journals-1         latest              4302dd5b2e85      4 hours ago         156 MB
      
  6.- Corremos la imagen en segundo plano (-d), la mapeamos en el puerto 8080 (-p).
      
      docker run -d -p 8080:8080 journals-1 
      
      CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                              NAMES
      
      9b1436b362a9        journals-1          "java -jar /root/u..."   5 seconds ago       Up 3 seconds        3306/tcp,      8081/tcp, 0.0.0.0:8080->8080/tcp   journals-1


   
  
   Link de la aplicacion: 
  
   http://10.252.7.84:8080/      

