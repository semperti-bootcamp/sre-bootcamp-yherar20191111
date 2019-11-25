# sre-bootcamp-yherar-03

# Requisitos.

       
        1. Deben configurarse todos los elementos solicitados [Java 8, Maven, MySQL, etc.]
        2. Deben proveerse screenshots validando los paquetes instalados
        3. Deben proveerse los scripts de configuración
        4. Deben describirse todos los pasos y requerimientos para ejecutar el script de Ansible
      

# Configuracion de la VM con Ansible.
  
  1.- Actualizamos nuestros repositorios : 
          
      yum install epel-release
      
  2.- Instalamos Ansible                                        
  
      yum install ansible
      
  3.- Editamos nuestro inventario y colocamos las IP de nuestro servidor: 
  
      vi /etc/ansible/hosts  
      
      [webserver]
      10.252.7.84

  4.- Generar una llave ssh para nuestro servidor:
  
       ssh-keygen
       ssh-copy-id  -i ~/.ssh/id_rsa.pub "10.252.7.84"
       
  5.- Verificamos que nuestro servidor esta bien enlazados:
 
      ansible all -m ping
       
    10.252.7.84 | SUCCESS => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/bin/python"
       },
        "changed": false,
         "ping": "pong"
       }
      
  6.- Se creo un playbook por cada paquete que tenemos que instalar:
  
     java-8.yml
     maven.yml
     mysql.yml
	
  7.- Screenshots validando los paquetes: 
  
   java.yml: 
	
	
	
	
	
	
	
	
  maven.yml
  
  
  
  
  
  mysql.yml
  







	
	
	
	
	
	
  
  
       
	
