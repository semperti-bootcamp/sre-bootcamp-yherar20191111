## 8.--Jenkins-CI

# Descripción:

    1.-Debe encontrarse dentro de un folder con el nombre bc-username
    2.-Debe ejecutarse el build cada vez que se realice un PR
    3.-Debe contener al menos, las etapas de configuración, unit testing, snapshot, release, upload a Nexus del artefacto de          Maven y de la imagen de Docker
    4.-Debe ejecutarse en un Jenkins slave propio

# Crear Pipeline de CI:

   1.- Creamos un Nuevo proyecto-Folder con las Pipeline:
   
   
   ![CI-1](https://user-images.githubusercontent.com/57635156/71136085-62139f00-21e2-11ea-948b-5cf0f565c0c8.jpg)   
   
   2.- Creamos un proyecto pipeline:  

   ![CI-2 0](https://user-images.githubusercontent.com/57635156/71136156-9e46ff80-21e2-11ea-9002-3ec4da4569d9.jpg)

   3.- Configuramos el proyecto pipeline:
   
   Colocamos la direccion de nuestro repisitorio de GitHub, especificando la rama en la cual va a tomar el Jenkinsfile.
   
   ![CI-3 0](https://user-images.githubusercontent.com/57635156/71136437-9a67ad00-21e3-11ea-934d-9daacc520cf9.jpg)
 
   4.- Creamos un slave y Lo configuramos, usamos las credenciales con las que nos conectamos a nuestro servidor por ssh:
   NOTA: se recomienda crear las credenciales con el usuario root para no tener problemas con los permisos.
   
   ![CI-5](https://user-images.githubusercontent.com/57635156/71137047-9472cb80-21e5-11ea-91fd-7f7c7291b434.jpg)

   5.- Configuramos el Jenkinsfile con las etapas de configuracion: unit testing, snapshot, release, upload a Nexus del                artefacto de Maven y de la imagen de Docker. 
   
 ![J1pro](https://user-images.githubusercontent.com/57635156/71526182-657aea80-28b4-11ea-8cb8-6ca6c4ecb698.jpg)


   
