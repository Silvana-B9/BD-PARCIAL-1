# BD-PARCIAL-1
Para poder desplegar un contenedor lo primero que debemos hacer en este caso si se hace desde un equipo con SO de Windows es instalar Docker Desktop, una vez instalado correctamente debemos dirigirnos a nuestra terminal donde se debe ejecutar el siguiente comando: 

docker run --name ulimar -e POSTGRES_USER=ulimar -e POSTGRES_PASSWORD=ex4men_db -p 5432:5432 -d postgres:14

Este comando se encarga de asignarle el nombre y la contraseña que vamos a usar en el Postgres, una vez que la imagen esta lista o se descargue escribimos este comando en la terminal siendo el que nos permite ingresar a pgAdmin:

docker run --name pgadmin-limar -p 5050:80 --link ulimar:ulimar -e "PGADMIN_DEFAULT_EMAIL=usuario@servilimar.com" -e "PGADMIN_DEFAULT_PASSWORD=limar#123" -d dpage/pgadmin4

Luego en nuestro navegador ingresamos a http://localhost:5050 que nos va a llevar a una página donde va a cargar pgAdmin, ahí debemos ingresar el correo y la contraseña que se uso en el comando anterior.
Después se debe crear un nuevo contenedor donde también se debe ingresar el usuario y la contraseña que fue asignado en el primer comando.
-	Nombre: ulimar
-	Contraseña: ex4men_db
Una vez se cree el servidor debe seguir cada uno de estos puntos (servilimar – Databases – postgres – schemas – public – tables) para después seleccionar “Query tool” con el fin de crear las tablas que vamos a usar en la base de datos. Posteriormente en esa nueva ventana se debe agregar cada una de las tablas que tenemos con sus respectivas relaciones, cuando ya se termine de escribir todas las tablas y sus registros lo ejecutamos para luego ver la tabla con cada uno de los registros que ingresamos anteriormente.
