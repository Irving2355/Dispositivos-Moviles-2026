# NexaSoft - Mesa de incidencias (versión recibida)

Aplicación de entrenamiento para mantenimiento de un producto heredado. Los datos son **ficticios**. Esta versión debe arrancar y mostrar incidencias; hay comportamientos defectuosos reportados por el cliente y peticiones de cambio pendientes. NO es un producto de operación real.

## Primera instalación

Prerequisito: Flutter instalado y al menos un dispositivo habilitado. El repositorio incluye el código fuente, los recursos y la configuración de dependencias; las carpetas nativas se generan con el SDK de Flutter instalado en cada equipo.

En la carpeta del proyecto:

```bash
flutter create . --project-name nexasoft_incidencias --platforms android,web,windows
flutter pub get
flutter run -d chrome
```

Para Android: conectar un teléfono con depuración USB y usar `flutter devices` y `flutter run -d <id>`; para Windows: `flutter run -d windows` (si el equipo cuenta con herramientas de escritorio).

**No usar** `flutter create` en una carpeta distinta ni sustituir los archivos `lib/` o `assets/`. El comando genera las carpetas nativas que faltan.

Scripts alternativos: `preparar.ps1` (Windows PowerShell) o `preparar.sh` (Linux/macOS); ejecutan la misma configuración.

## Características visibles

- Lista y detalle de incidencias, búsqueda y contador por estado.
- Registro de incidencias en el almacenamiento local del dispositivo.
- Cambio de estado desde la pantalla de detalle.
- Botón de reinicio de datos de demostración (ícono de flecha circular en la barra superior).

La app usa un JSON de ejemplo como datos iniciales; después almacena los registros localmente. **Cambiar el JSON incluido no equivale a actualizar registros ya creados en el almacenamiento del dispositivo.** La opción Restablecer demostración elimina los cambios locales y restaura la semilla; usarla solo cuando se requiera reiniciar pruebas.

## Trabajo

Los tickets, requisitos de aceptación, bitácora individual y protocolo de uso de IA están en el documento de práctica distribuido por el profesor.

No copiar el código a asistentes públicos sin permiso. Los datos actuales son ficticios, pero se simulan los controles de confidencialidad de una empresa real.
