# Flutter base project
## Getting Started

Use android studio to setup or terminal like below.

Running each flavor on DEBUG mode:
```sh
flutter run –flavor qa -t lib/main_qa.dart
flutter run –flavor dev -t lib/main_dev.dart
flutter run –flavor prod -t lib/main_production.dart
```

Running each flavor on PROFILE mode:
```sh
flutter run –profile –flavor qa -t lib/main_qa.dart
flutter run –profile –flavor dev -t lib/main_dev.dart
flutter run –profile –flavor prod -t lib/main_production.dart
```

Running each flavor on RELEASE mode:
```sh
flutter run –release –flavor qa -t lib/main_qa.dart
flutter run –release –flavor dev -t lib/main_dev.dart
flutter run –release –flavor prod -t lib/main_production.dart
```
