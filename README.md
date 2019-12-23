## 9.--Jenkins-CI

# Descripción:

    1.-Debe encontrarse dentro de un folder con el nombre bc-username
    2.-Debe ejecutarse el build cada vez que se realice un PR
    3.-Debe contener al menos las etapas de descarga de imagen, ejecución de contenedor y prueba de acceso a la aplicación          mediante un curl y su output
  
# Crear Pipeline de CD:

  1.-Creamos otra pipelien.

  ![CI-2 0](https://user-images.githubusercontent.com/57635156/71253685-5968b900-2307-11ea-92b3-230698240ef9.jpg)

  2.- Actulizamos el Jenkisfile con las etapas de: descarga de imagen, ejecución de contenedor y prueba de acceso a la               aplicación mediante un curl.
  
  
       stage('delete unused image') {
            when {
                // Ejecuta esta etapa solo cuando este "true"
                 expression { params.REQUESTED_ACTION == 'true' } 
                 }
                steps {             
                  sh "docker ps"
                  sh "docker stop 8d01b6a3e424"
                  sh "docker images"
                  sh "docker rmi -f 11a95ec8e08c"
               }
             } 
             
        stage('run new image') {
         steps {
                  sh "docker pull yherar10/bootcamp:bc-ci-2.0"
                  sh "docker run -d -p 8080:8080 --network=host docker.io/yherar10/bootcamp:bc-ci-2.0"
                }
              }
    
        stage('curl app') {
          steps {
                  timeout(time: 2, unit: 'MINUTES') {
                    retry(100) {
                        sh 'curl http://10.252.7.84:8080/'
                    }
                  }
                }
              } 
            }
          }
        
        
        
  3.-0utput de curl:

              + curl http://10.252.7.84:8080/
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

     0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    100   782  100   782    0     0  24697      0 --:--:-- --:--:-- --:--:-- 25225
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Semperti - Journal System</title>
        <script src="js/angular-min.js"></script>
        <script src="js/app.js"></script>
       <link rel="stylesheet" type="text/css" href="css/style.css" />
     </head>
     <body ng-app="JournalApp" ng-controller="CategoryController">
    <h2>Bienvenido al sistema de jornales de Semperti</h2>




    <div ng-controller="getCategories">
    <table>
        <thead>
        <td>Categoría</td>
        <td>Subscribirse</td>
        </thead>
        <tbody>

        <tr ng-repeat="category in categories">
            <td>{{category.name}}</td>
            <td>
                <a href="/login">Login</a>
            </td>
        </tr>
        </tbody>
    </table>
    </div>
    </body>
    </html>

     




