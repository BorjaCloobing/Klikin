# Klikin

Es proyecto consiste en una aplicación nativa hecha en Swift 3, cuyo propósito es mostrar una listado de comercios con su
información corporativa, para ello la aplicación embebe dichos datos de un json proporcionado.
![alt text](https://github.com/BorjaCloobing/Klikin/blob/master/Captura%20de%20pantalla%202017-07-05%20a%20las%2017.49.54.png)

En el proyecto he intentado utilizar el máximo número de componentes y features que el tiempo me ha dejado. 
Paso a detallar algunos de ellos
*Recordar que para el correcto funcionamiento del proyecto hay que descargar y arrastrar el FW Hanneke.
He usado un MVC como patrón de diseño.
Frameworks utilizados :

1.SwiftyJson, librería que agilizar las consultas a APIS, pese a que este proyecto solo tiene 1 llamada.
2.Hanneke, librera para cacheo y tratado de imágenes. Con el fin de mejorar el UX del usuario.
![alt text](https://github.com/BorjaCloobing/Klikin/blob/master/Captura%20de%20pantalla%202017-07-05%20a%20las%2017.47.43.png)

La aplicación se ha montado para poder ser multiidioma de esta manera , tan sólo tenemos que traducir en un archivo las
palabras que queramos traducir. Para comprobarlo se puede cambiar el idioma en el Scheme del terminar y ver que tanto los 
botonos cono las alertas varían.
![alt text](https://github.com/BorjaCloobing/Klikin/blob/master/Captura%20de%20pantalla%202017-07-05%20a%20las%2017.47.55.png)


He intentando recoger tantos posibles errores como se me han ocurrido, ya sean introducción mal de datos, parseo de 
campos erróneos ("Ya que en dicho JSON me he encontrado algunos"),comprobar que el terminal tiene acceso a internet 
antes de hacer consultas, y en caso contrario notificarlo al usuario.

Se ha intentado aprovechar al máximo los recursos del terminal en memoria y CPU, trabajando con distintos hilos, para la 
coordinación del spinner, overlay etc.

Componentes nativos utilizados entre otros

1.Navigation Controller
2.TableView
3.Constraints
4.Mapkit
5.GradientView
![alt text](https://github.com/BorjaCloobing/Klikin/blob/master/Captura%20de%20pantalla%202017-07-05%20a%20las%2017.50.26.png)
![alt text](https://github.com/BorjaCloobing/Klikin/blob/master/Captura%20de%20pantalla%202017-07-05%20a%20las%2017.50.36.png)

