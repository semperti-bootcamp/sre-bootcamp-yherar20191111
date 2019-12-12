
  ## 5.--Nexus
  
  
# Requisitos: 

	1.-Se debe cargar en Nexus un snapshot de la aplicación Java
	2.-Se debe cargar en Nexus un release de la aplicación Java
	3.-Se deben realizar mediante un script de Ansible
	4.-Se debe proveer todos los archivos necesarios para realizar estas tareas


# Cargar aplicacion Java en Repositorios Nexus:

   1.- Agregamos en nuestro pom.xml la direccion de nuestro repositorio:
   
       <distributionManagement>
         <snapshotRepository>
          <id>snapshots</id>
          <url>http://localhost:8081/repository/maven-snapshots/</url>
         </snapshotRepository>
         <repository>
          <id>releases</id>
          <url>http://localhost:8081/repository/maven-releases/</url>
        </repository>
      </distributionManagement>
     
     
   2.- Colocamos una dependencia:
   
        <dependency>
           <groupId>org.apache.maven.plugins</groupId>
           <artifactId>maven-release-plugin</artifactId>
           <version>2.5.3</version>
           <type>maven-plugin</type>
       </dependency>
       
   
   3.- Colocamos en settings.xml nuestras credenciales:
   
       <server>
        <id>snapshots</id>
        <username>user</username>
        <password>password</password>
      </server>
      <server>
       <id>releases</id>
       <username>user</username>
       <password>password</password>
      </server>
   
   NOTA: Tener en cuenta al momento de configurar las credenciales deben estar correctas, si no es asi saldra el error (401)
       
  
   4.-  Creacion y deploy de snapshot y release:
    
   
   snapshot: 
              
    mvn versions:set -DnewVersion=8.8-SNAPSHOT
    mvn clean deploy

   release:  
   
    mvn versions:set -DnewVersion=8.9
    mvn clean deploy
	     
	     
   5.- Creacion de playbooks:
   
   Se crearon dos playbooks, uno para un snapshot y otro para un release:
  
     
     asnible-playbook  snapshot.yml
       
   ![snapshot](https://user-images.githubusercontent.com/57635156/70404041-7bb12b80-1a17-11ea-9fe3-ee2f4c91b864.jpg)

    
    
    
    ansible-playbook  release.yml
	     
![release](https://user-images.githubusercontent.com/57635156/70404072-9683a000-1a17-11ea-8ca9-b783baa1df0e.jpg)
  
