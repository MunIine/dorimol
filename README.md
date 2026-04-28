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

Дори (Dorimol) - мобильное Flutter-приложение онлайн-магазина. Проект реализует полный пользовательский поток: авторизация по номеру телефона, каталог, поиск и сортировка товаров, корзина и оформление заказа (доставка/самовывоз), профиль и история заказов.

## О проекте

Изначально приложение разрабатывалось мною с нуля (в роли единственного Flutter & Backend разработчика) и было успешно запущено в production (Google Play и App Store) на стадии MVP. Позже развитие продукта со стороны бизнеса было заморожено, после чего я выкупил права на исходный код. Проект прошёл стадию ребрендинга и был доведён до логической точки. Сейчас он выступает в роли масштабного pet-проекта с реальной production-историей.

## Ключевой функционал

- Авторизация по номеру телефона через Firebase Auth (SMS OTP).
- Обмен с собственным backend и работа с JWT-токенами.
- Редактирование профиля пользователя.
- Поиск товаров по названию и артикулу.
- Сортировка каталога и просмотр карточки товара.
- Оформление заказа с выбором доставки или самовывоза.
- Персональные скидки в зависимости от количества заказов.
- Онбординг для первого запуска.

## Технологический стек

- Flutter, Dart.
- State management: `flutter_bloc`.
- Маршрутизация: `auto_route`.
- Сеть: `dio`, `retrofit`.
- Сериализация: `json_serializable`.
- Авторизация: `firebase_auth`.
- DI: `get_it`.
- Логирование: `talker_flutter`.

## Архитектура

Проект организован в формате `features-first`:

- `features/` - бизнес-фичи (экраны, BLoC, локальные виджеты).
- `models/` - доменные и API-модели.
- `api/` - API-клиенты и интерсепторы.
- `data/` - сервисы, конфигурация, константы и утилиты.
- `router/` - навигация и guard-логика.
- `theme/` - дизайн-система приложения.
- `widgets/` - переиспользуемые UI-компоненты.

Каждая основная фича включает:

- `screen`/`screens` для UI-слоя.
- `bloc` (`event/state/bloc`) для управления состоянием.
- `widgets` для локальных компонентов.

## API и сервисы

- `public_api_client` - запросы без авторизации.
- `private_api_client` - запросы с JWT.
- Сервисы: `auth_service`, `token_service`, `storage_service`, `config_service`, `ui_service`.


## Настройка и запуск

#### Переменные окружения

Создайте файл `.env` в корне проекта и добавьте необходимые переменные:

```
API_URL=https://api.example.com:port
```

#### Настройка Firebase

Проект использует Firebase Authentication (SMS OTP).
Для локального запуска необходимо подключить собственный Firebase-проект:

1. Создайте проект на [Firebase Console](https://console.firebase.google.com).
2. Подключите приложение через [FlutterFire CLI](https://firebase.flutter.dev/docs/cli):
```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
```
   Команда сгенерирует файл `lib/firebase_options.dart` и разместит
   `google-services.json` (Android) и `GoogleService-Info.plist` (iOS)
   в нужные директории автоматически.
3. Включите метод входа `Phone` в разделе Authentication → Sign-in method.

#### Запуск проекта

```bash
flutter pub get
flutter run
```

## Лицензия

Проект распространяется по лицензии **All Rights Reserved**. Подробные условия: `LICENCE.md`.