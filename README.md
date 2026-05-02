<p align="center">
	<img src="./lib/assets/repo/icon.png" alt="Icon" width="128"/>
</p>

<p align="center" style="bottom-padding: 0px">
  <a href="https://github.com/MunIine/dorimol_api">
    <img src="https://img.shields.io/badge/Backend-FastAPI-059487?logo=fastapi&logoColor=white"/>
  </a>
  <img src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-lightgrey"/>
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Flutter-3.41+-1181a6?logo=flutter"/>
  </a>
  <a href="https://dart.dev">
    <img src="https://img.shields.io/badge/Dart-3.11.3+-045697?logo=dart&logoColor=white"/>
  </a>
  <a href="https://pub.dev/packages/firebase_auth">
    <img src="https://img.shields.io/badge/Auth-Firebase-f7c603?logo=firebase&logoColor=white"/>
  </a>
  <a href="https://pub.dev/packages/flutter_bloc">
    <img src="https://img.shields.io/badge/State-BLoC-007fba"/>
  </a>
</p>
<p align="center">
  <img src="./lib/assets/repo/Screen 1.png"/>
  <img src="./lib/assets/repo/Screen 2.png"/>
  <img src="./lib/assets/repo/Screen 3.png"/>
</p>

Dori (Dorimol) is a mobile Flutter e-commerce application. The project implements a complete user flow: phone number authentication, catalog, product search and sorting, cart and order placement (delivery/pickup), profile, and order history.
 
## Project History
 
Originally, the app was developed by me from scratch (as the sole Flutter & Backend developer) and was successfully launched to production (Google Play and App Store) at the MVP stage. Later, the business side froze further product development, after which I purchased the rights to the source code. The project went through a rebranding stage and was brought to a logical conclusion. It now serves as a large-scale pet project with a real production history.
 
## Key Features
 
- Phone number authentication via Firebase Auth (SMS OTP).
- Communication with a custom backend and JWT token handling.
- User profile editing.
- Product search by name and SKU.
- Catalog sorting and product card viewing.
- Order placement with delivery or pickup selection.
- Personal discounts based on order count.
- Onboarding for first launch.


## Tech Stack
 
- Flutter, Dart.
- State management: `flutter_bloc`.
- Routing: `auto_route`.
- Networking: `dio`, `retrofit`.
- Serialization: `json_serializable`.
- Authentication: `firebase_auth`.
- DI: `get_it`.
- Logging: `talker_flutter`.
## Architecture
 
The project is organized in a `features-first` format:
 
- `features/` — business features (screens, BLoC, local widgets).
- `models/` — domain and API models.
- `api/` — API clients and interceptors.
- `data/` — services, configuration, constants, and utilities.
- `router/` — navigation and guard logic.
- `theme/` — app design system.
- `widgets/` — reusable UI components.
Each main feature includes:
 
- `screen`/`screens` for the UI layer.
- `bloc` (`event/state/bloc`) for state management.
- `widgets` for local components.
## API & Services
 
- `public_api_client` — unauthenticated requests.
- `private_api_client` — requests with JWT.
- Services: `auth_service`, `token_service`, `storage_service`, `config_service`, `ui_service`.



## Setup & Launch
 
#### Environment Variables
 
Create a `.env` file in the project root and add the required variables:
 
```
API_URL=https://api.example.com:port
```
 
#### Firebase Setup
 
The project uses Firebase Authentication (SMS OTP).
To run locally, you need to connect your own Firebase project:
 
1. Create a project on [Firebase Console](https://console.firebase.google.com).
2. Connect the app via [FlutterFire CLI](https://firebase.flutter.dev/docs/cli):
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
   The command will generate `lib/firebase_options.dart` and place
   `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   in the correct directories automatically.
3. Enable the `Phone` sign-in method under Authentication → Sign-in method.
 
#### Running the Project
 
```bash
flutter pub get
flutter run
```
 
## License
 
The project is distributed under the **All Rights Reserved** license. Full terms: `LICENCE.md`.