import 'package:flutter/material.dart';
import 'config/flavor_config.dart';

import 'my_app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    color: Colors.red,
    values: FlavorValues(baseUrl: 'base-flutter.production.vn'),
  );
  runApp(const MyApp());
}
