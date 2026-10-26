# Rutas del campus - practica de 5 clases

Este paquete NO contiene el proyecto Flutter entero (android/, ios/, web/), para
no fijar configuraciones de plataforma a una version del SDK de cada laboratorio.

## Instalacion (Windows o Linux)

1. Abrir una terminal en un directorio de trabajo.
2. `flutter create rutas_campus`
3. Copiar las carpetas `lib/` y `assets/` de ESTE paquete encima del proyecto.
4. Sustituir el `pubspec.yaml` creado por el de ESTE paquete.
5. Desde `rutas_campus/`, ejecutar `flutter pub get`.
6. Conectar el dispositivo Android o usar Chrome: `flutter devices`.
7. Ejecutar: `flutter run -d <id_del_dispositivo>`.

No se necesitan paquetes adicionales ni conexion a Internet en tiempo de ejecucion.
Las imagenes estan dentro de assets y los datos son ejemplos en memoria.
Las modificaciones NO persisten despues de cerrar la aplicacion: eso se vera en
la unidad de almacenamiento.
