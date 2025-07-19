# my_barber_app

Aplicación Flutter para la gestión y reserva de servicios de barbería.

## Descripción

**my_barber_app** es una app multiplataforma desarrollada en Flutter que permite a los usuarios buscar servicios de barbería, agendar citas, consultar información de locales y barberos, y gestionar sus reservas de manera sencilla.

## Características principales

- Búsqueda de servicios y barberos.
- Visualización de promociones y servicios destacados.
- Agenda de citas con selección de fecha y hora.
- Panel administrativo para gestión de servicios.
- Interfaz moderna y responsiva.

## Instalación

1. Clona el repositorio:
   ```sh
   git clone https://github.com/tu_usuario/my_barber_app.git
   ```
2. Instala las dependencias:
   ```sh
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```sh
   flutter run
   ```

## Estructura del proyecto

```
my_barber_app/
├── android/
├── build/
├── ios/
├── lib/
│   ├── main.dart
│   ├── views/
│   │   └── home/
│   │       └── home_view.dart
│   ├── widgets/
│   │   └── home/
│   │       ├── service_list.dart
│   │       ├── service_card.dart
│   │       ├── promo_banner.dart
│   │       └── trending_section.dart
│   │   └── shared/
│   │       ├── shared_bar.dart
│   │       ├── bottom_navigation_bar.dart
│   │       └── sirve_filter.dart
│   └── core/
│       └── theme/
│           └── app_theme.dart
├── linux/
├── macos/
├── test/
├── web/
│   ├── index.html
│   └── manifest.json
├── windows/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── README.md
```

## Recursos útiles

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Documentación oficial de Flutter](https://docs.flutter.dev/)

## Licencia

Este proyecto está bajo la licencia MIT.

## Contacto

Para dudas o sugerencias, escribe a [tu_email@ejemplo.com](mailto:tu_email@ejemplo.com)