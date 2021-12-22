import 'package:flutter/material.dart';

enum Flavor {
  dev,
  qa,
  production,
}

extension FlavorExt on Flavor {
  String getName() {
    switch (this) {
      case Flavor.dev:
        return 'DEV';
      case Flavor.qa:
        return 'QA';
      case Flavor.production:
        return 'Production';
    }
  }
}

class FlavorValues {
  final String baseUrl;
  //Add other flavor specific values, e.g database name

  FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required Color color,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      flavor.getName(),
      color,
      values,
    );

    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig? get instance => _instance;

  static bool isProduction() => _instance?.flavor == Flavor.production;
  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
  static bool isQA() => _instance?.flavor == Flavor.qa;
}
