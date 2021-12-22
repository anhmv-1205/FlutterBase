import 'package:flutter/material.dart';
import 'config/flavor_config.dart';

import 'my_app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.qa,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(baseUrl: 'base-flutter.qa.vn'),
  );
  runApp(const MyApp());
}