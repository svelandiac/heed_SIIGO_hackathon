# Heed 
### Santiago Velandia Casas

Aplicación para el Hackathon de SIIGO.

## Stack de tecnologías

El proyecto es una aplicación móvil, que lleva las cuentas de los clientes (aquellos empleados que pertenecen a una empresa) para que puedan añadir masivamente productos (con un archivo CSV) o manualmente, y ver la lista de sus productos, con un pequeño resumen.

Fue diseñado en Flutter como Framework para Frontend, el cuál usa Dart como lenguaje de programación.

Para el backend se usó Firebase como servicio Cloud. De allí podemos extraer diferentes servicios tales como:
- Authenticacion: Servicio de autenticación.
- Cloud Firestore: Base de datos no relacional basada en colecciones en tiempo real.
- Cloud Functions: Funciones para crear API's que podamos usar en nuestras aplicaciones.
- Storage: Donde almacenaremos nuestros archivos.

## Arquitecturas

La arquitectura que se usa en el Frontend es bastante sencilla.
Consta de un MVC que realiza:
- La conexión con el backend en la capa de access-data. 
- La conexión de la capa de datos y la UI por medio de la capa de lógica de negocio.
- La UI se encarga de mostrar los elementos gráficos.

En el Front end no se realizan operaciones complejas de ningún tipo, ya que al tratarse de una App Móvil disponemos de pocos recursos computacionales.


La arquitectura del Backend sin embargo es bastante más completa.
Para la distribución de la información en las bases de datos se usó el modelo Multitenant, el cuál se basa en un distribuidor central que se encarga de recibir una referencia a algún sitio, y crear la conexión pertinente a la base de datos que corresponda.

El modelo es óptimo cuando se tienen múltiples bases de datos, pero yo lo simulo creando varias colecciones como si se tratase de bases de datos.

Para la extracción de la información por el archivo CSV se hace lo siguiente:
1. Se sube el archivo a Firebase Storage.
2. Se llama un API creado en Cloud Functions que descarga dicho archivo, lo transforma a un JSON y recibe la lista de productos.
3. El mismo API se encarga de llenar la base de datos con cada uno de esos productos, llevándolos a donde les corresponda gracias al modelo Multitenant.

Es importante notar que toda la parte algorítmica la realiza el servidor, y el app solo realiza llamadas a las APIs para obtener la información.
