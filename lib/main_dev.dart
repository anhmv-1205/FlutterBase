import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'config/flavor_config.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(baseUrl: 'base-flutter.dev.vn'),
  );

  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
