## sre-bootcamp-yherar-03

# Requisitos:
	
     1.- Deben configurarse todos los elementos solicitados [Java 8, Maven, MySQL, etc.]
     2.-Deben proveerse screenshots validando los paquetes instalados 
     3-.Deben proveerse los scripts de configuración
     4.-Deben describirse todos los pasos y requerimientos para ejecutar el script de Ansible
     
# Configuracion de la VM con Ansible
 
  1-. Actualizamos nuestros repositorios:
  
    dnf update 
       
  2.- Instalamos Ansible:
  
    dnf install ansible
    
  3.- Editamos nuestro inventario y colocamos nuestra IP del servidor:
  
     vi /etc/ansible/hosts 
     [webserver]
     10.252.7.84
  
  4.- Creamos la llave ssh para nuestro servidor:
  
     ssh-keygen
     ssh-copy-id  -i ~/.ssh/id_rsa.pub "10.252.7.84" 
     
  5.- Verifivamos si nuestro servidor esta enlazado:
  
     ansible 10.252.7.84 .m ping
     10.252.7.84 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
    } 
    
   6.- Se creo un playbook por cada paquete:
   
    java-8.yml
    maven.yml
    mysql.yml
   
   7.- Se ejecutan los playbook:
   
    ansible-playbook java-8.yml    
      
  ![ansible-java](https://user-images.githubusercontent.com/57635156/69590413-23693b00-0fce-11ea-9a16-68b5fcfe89af.jpg)

   
    ansible-playbook maven.yml
     
  ![ansible-maven](https://user-images.githubusercontent.com/57635156/69590487-7511c580-0fce-11ea-8d6f-23ca55695bbf.jpg)


    ansible-playbook mysql.yml
     
  ![ansible-mysql](https://user-images.githubusercontent.com/57635156/69590570-b6a27080-0fce-11ea-94d4-d5beb5483172.jpg)

      
      
      
      
    
    
    
