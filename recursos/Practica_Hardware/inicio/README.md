# Práctica 2 - Hardware del dispositivo

Esta base es un **PUNTO DE PARTIDA**, no un proyecto Flutter completo y resuelto.

El objetivo es desarrollar una aplicación móvil que permita utilizar tres recursos físicos del dispositivo:

- **Cámara:** capturar fotografías y mostrarlas en pantalla.
- **GPS:** obtener las coordenadas geográficas actuales.
- **Acelerómetro:** consultar los valores de movimiento e inclinación.

La aplicación se desarrollará para **Android e iOS**.

## 1. Crear el proyecto con Flutter

Abrir una terminal y ejecutar:

```bash
flutter create --platforms=android,ios practica_hardware
cd practica_hardware
```

Copiar los siguientes archivos del código base:

- `inicio/lib/main.dart` → `lib/main.dart`
- `inicio/lib/pantalla_hardware.dart` → `lib/pantalla_hardware.dart`

**Importante:** no sustituir las carpetas `android/` ni `ios/`; son generadas por Flutter para el proyecto y las herramientas disponibles.

Si la carpeta `ios/` no se generó, posteriormente puede crearse desde una Mac con:

```bash
flutter create --platforms=ios .
```

## 2. Verificar el punto de partida

Primero instalar las dependencias existentes:

```bash
flutter pub get
```

Consultar los dispositivos disponibles:

```bash
flutter devices
```

Ejecutar la aplicación en Android:

```bash
flutter run -d ID_ANDROID
```

Reemplazar `ID_ANDROID` por el identificador del dispositivo mostrado por Flutter.

La pantalla inicial debe mostrar tres tarjetas con botones que indican **"Pendiente"**.

Todavía no están implementadas las funciones de cámara, ubicación ni sensores. Estas se desarrollarán durante las clases.

## 3. Agregar las dependencias

Desde la carpeta principal del proyecto ejecutar:

```bash
flutter pub add 'image_picker:^1.2.4' 'geolocator:^14.1.2' 'sensors_plus:^6.1.2'
```

Estas dependencias se utilizarán para:

| Dependencia | Función |
|---|---|
| `image_picker` | Acceder a la cámara y galería |
| `geolocator` | Obtener la ubicación del dispositivo |
| `sensors_plus` | Leer los sensores de movimiento |

Comprobar la instalación:

```bash
flutter pub get
flutter analyze
```

Los permisos de Android e iOS se configurarán en la clase.

---

## 4. Generar un APK para Android

Un archivo **APK** es un paquete instalable de Android. Permite instalar la aplicación en un teléfono sin ejecutar Flutter desde la computadora.

Se puede generar desde **Linux, Windows o macOS**, siempre que las herramientas de Android estén correctamente configuradas.

### 4.1. Generar un APK de prueba (Debug)

Ejecutar desde la raíz del proyecto:

```bash
flutter build apk --debug
```

El archivo se guarda normalmente en:

```text
practica_hardware/
└── build/
    └── app/
        └── outputs/
            └── flutter-apk/
                └── app-debug.apk
```

Este APK se utiliza para realizar pruebas durante el desarrollo.

### 4.2. Generar un APK de producción (Release)

Ejecutar:

```bash
flutter build apk --release
```

El archivo generado se encuentra en:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Este paquete está optimizado para su distribución. Para una distribución formal debe revisarse la configuración de firma digital de Android.

### 4.3. Generar APK por arquitectura

También es posible generar versiones específicas para diferentes procesadores:

```bash
flutter build apk --release --split-per-abi
```

Se generan normalmente estos archivos:

```text
build/app/outputs/flutter-apk/
├── app-armeabi-v7a-release.apk
├── app-arm64-v8a-release.apk
└── app-x86_64-release.apk
```

Para la mayoría de los teléfonos Android modernos se utiliza `arm64-v8a`.

Estas versiones suelen ocupar menos espacio que un APK universal.

### 4.4. Generar un archivo AAB para Google Play

El formato recomendado para publicar aplicaciones en Google Play es **Android App Bundle (AAB)**.

Ejecutar:

```bash
flutter build appbundle --release
```

El archivo se genera normalmente en:

```text
build/app/outputs/bundle/release/app-release.aab
```

**Diferencia importante:**

- `.apk`: permite instalar directamente una aplicación Android.
- `.aab`: paquete utilizado para distribuir la aplicación mediante Google Play; no se instala directamente como un APK.

### 4.5. Instalar el APK en un teléfono

Conectar el teléfono Android mediante USB y habilitar la depuración USB.

Para instalar un APK generado:

```bash
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

El parámetro `-r` permite reemplazar una instalación anterior de la misma aplicación cuando las firmas son compatibles.

También se puede copiar el APK al teléfono e instalarlo manualmente, autorizando la instalación desde esa fuente cuando Android lo solicite.

---

## 5. Generar la aplicación para iOS

**Importante:** para compilar una aplicación iOS es necesario utilizar **macOS con Xcode**. No se puede generar directamente un IPA de iOS desde Linux o Windows utilizando únicamente el SDK de Flutter.

### 5.1. Preparar el proyecto en macOS

Copiar el proyecto Flutter a una Mac y abrir una terminal en su carpeta.

Ejecutar:

```bash
flutter doctor -v
flutter pub get
```

Si falta la carpeta `ios/`, generarla:

```bash
flutter create --platforms=ios .
```

Verificar los dispositivos:

```bash
flutter devices
```

### 5.2. Configurar la firma de iOS

Abrir el proyecto de Xcode:

```bash
open ios/Runner.xcworkspace
```

En Xcode:

1. Seleccionar el proyecto `Runner`.
2. Seleccionar el target `Runner`.
3. Entrar a **Signing & Capabilities**.
4. Activar `Automatically manage signing`.
5. Seleccionar el equipo de desarrollo en `Team`.
6. Configurar un `Bundle Identifier` único.

Para compilar y distribuir un IPA firmado es necesario contar con los certificados y perfiles de aprovisionamiento adecuados. La publicación mediante App Store o TestFlight requiere participar en el Apple Developer Program.

### 5.3. Ejecutar la aplicación en iPhone

Conectar el iPhone a la Mac, autorizar la computadora y preparar la firma de desarrollo.

Consultar los dispositivos:

```bash
flutter devices
```

Ejecutar:

```bash
flutter run -d ID_IPHONE
```

Reemplazar `ID_IPHONE` por el identificador correspondiente.

### 5.4. Generar una compilación iOS

Para compilar la aplicación sin generar todavía un IPA:

```bash
flutter build ios --release
```

El paquete de aplicación se encuentra normalmente en:

```text
build/ios/iphoneos/Runner.app
```

**Nota:** este archivo `.app` no equivale a un IPA listo para distribuir.

### 5.5. Generar un IPA

El archivo **IPA** es el paquete utilizado para distribuir aplicaciones iOS.

Ejecutar en macOS:

```bash
flutter build ipa --release
```

Este comando requiere una configuración válida de firma y aprovisionamiento.

Flutter genera normalmente los siguientes directorios:

```text
practica_hardware/
└── build/
    └── ios/
        ├── archive/
        │   └── Runner.xcarchive
        └── ipa/
            └── Runner.ipa
```

El nombre exacto del archivo IPA puede variar dependiendo de la configuración del proyecto.

- `build/ios/archive/`: contiene el archivo de Xcode utilizado para archivar y distribuir la aplicación.
- `build/ios/ipa/`: contiene el IPA exportado, cuando la exportación se completa correctamente.

El IPA puede distribuirse mediante los mecanismos autorizados de Apple, como TestFlight, App Store o distribución Ad Hoc correctamente configurada.

---

## 6. ¿Dónde se guardan los archivos generados?

| Plataforma | Archivo | Ubicación habitual |
|---|---|---|
| Android Debug | `.apk` | `build/app/outputs/flutter-apk/app-debug.apk` |
| Android Release | `.apk` | `build/app/outputs/flutter-apk/app-release.apk` |
| Android Google Play | `.aab` | `build/app/outputs/bundle/release/app-release.aab` |
| iOS compilado | `.app` | `build/ios/iphoneos/Runner.app` |
| iOS Archive | `.xcarchive` | `build/ios/archive/` |
| iOS distribuible | `.ipa` | `build/ios/ipa/` |

Todas las rutas son relativas a la carpeta principal del proyecto Flutter.

Para localizar los APK desde la terminal de Zorin:

```bash
find build -name "*.apk"
```

Para localizar archivos AAB:

```bash
find build -name "*.aab"
```

En macOS, para localizar un IPA:

```bash
find build -name "*.ipa"
```

## 7. Comandos útiles durante el desarrollo

```bash
# Consultar dispositivos conectados
flutter devices

# Consultar problemas de configuración
flutter doctor -v

# Instalar dependencias
flutter pub get

# Analizar el código
flutter analyze

# Ejecutar pruebas automatizadas
flutter test

# Ejecutar en un dispositivo
flutter run

# Limpiar archivos generados
flutter clean

# Recuperar dependencias después de limpiar
flutter pub get
```

Después de ejecutar `flutter clean`, es necesario generar nuevamente los APK, AAB o IPA que se hayan eliminado.

## 8. Documentación oficial

- [Flutter — Compilación y distribución Android](https://docs.flutter.dev/deployment/android)
- [Flutter — Compilación y distribución iOS](https://docs.flutter.dev/deployment/ios)
- [Flutter — Configuración de iOS](https://docs.flutter.dev/platform-integration/ios/setup)
- [Flutter — Documentación general](https://docs.flutter.dev)

---

**Nota final:** generar un APK o IPA demuestra que la aplicación pudo compilarse y empaquetarse. No garantiza que todas las funcionalidades de hardware funcionen correctamente; estas deben verificarse en dispositivos físicos con los permisos correspondientes.