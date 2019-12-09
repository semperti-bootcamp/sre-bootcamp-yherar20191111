

 
   ## sre-bootcamp-yherar-04

# Requisitos:

      1.-Se debe proveer un link de acceso a la aplicación
      2.-Debe quedar 100% funcional [crear un jornal (PDF), ver PDFs previos, etc]
      3.-Debe pasar el testeo de Maven

# Probar aplicacion Java: 

  1.- Me conecto a traves de ssh a la VM:
        
      ssh root@10.252.7.84
      
  2.- Instalo git y clono el repositorio: 
  
      yum install git 
      
      git clone git@github.com:semperti-bootcamp/sre-bootcamp-yherar-11-11-2019.git
      
  3.- Ejecutamos en orden los siguientes comandos para ejecurtar el mvn spring-boot:run, limpiar nuestro proyecto,crear y           ejecutar el .jar:
  
      mvn spring-boot:run
      mvn clean compile
      mvn clean test
      mvn clean package 
      mvn clean install
      java -jar /home/yherar/wee01/Code/target/journals-1.0.jar

 4.- Creamos una carpeta y copiamos los PDFs para poder visualizarlos:
    
     mkdir /root/upload
     cp -Rf /home/yherar/week01/PDFs/*   /root/upload
     
     
  5.- Revisamos la siguente direccion:
  
      http://10.252.7.84:8080
      
      
   ![spring-boot2](https://user-images.githubusercontent.com/57635156/69754867-b7094b80-1135-11ea-8da4-53539a685ad3.jpg)

 
  6.- Vemos el PDF: 
  
  
   ![PDFs2](https://user-images.githubusercontent.com/57635156/69754660-3b0f0380-1135-11ea-9eae-3143866eaa8e.jpg)      
