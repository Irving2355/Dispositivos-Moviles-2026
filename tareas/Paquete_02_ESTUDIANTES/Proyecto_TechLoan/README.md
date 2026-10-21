# TechLoan · NexaSoft Solutions

Aplicación Flutter de control de préstamos de equipo tecnológico. Proyecto heredado de mantenimiento.

## Requisitos
- Flutter con Dart 3.4 o posterior.
- Editor compatible con Flutter (por ejemplo, VS Code).
- Chrome o un teléfono Android configurado para ejecutar Flutter.

## Preparación

Desde la carpeta raíz:

```bash
flutter create . --project-name techloan
flutter pub get
flutter run -d chrome --web-port 7357
```

Alternativamente, seleccione otro dispositivo detectado por `flutter devices`.

## Organización actual

- `lib/main.dart`: punto de entrada y navegación.
- `lib/models`: estructuras de datos.
- `lib/data`: catálogo y préstamos iniciales de demostración.
- `lib/services`: almacenamiento local.
- `lib/state`: operaciones de la aplicación.
- `lib/pages`: pantallas.
- `lib/widgets`: componentes de la interfaz.
- `test`: pruebas automatizadas iniciales.

## Datos de prueba

La primera ejecución muestra un catálogo y varios préstamos ficticios. Los cambios se almacenan localmente mediante `shared_preferences`. Para comparar resultados tras reiniciar en Chrome, reutilice siempre el mismo puerto (`--web-port 7357`), ya que el almacenamiento web depende del origen. Para comenzar de nuevo puede borrar los datos del sitio/aplicación (el procedimiento depende del dispositivo). No se conecta a un servidor externo.

## Trabajo del equipo

Este README puede ampliarse con los integrantes, instrucciones de instalación, decisiones de mantenimiento y estado de la entrega. Los requerimientos oficiales y la política de trabajo se proporcionan por separado en la guía de la práctica.
