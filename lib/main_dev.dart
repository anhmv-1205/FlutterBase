import 'package:flutter/material.dart';
import 'config/flavor_config.dart';

import 'my_app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(baseUrl: 'base-flutter.dev.vn'),
  );
  runApp(const MyApp());
}
