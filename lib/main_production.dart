import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/flavor_config.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlavorConfig(
    flavor: Flavor.production,
    color: Colors.red,
    values: FlavorValues(baseUrl: 'base-flutter.production.vn'),
  );

  runZonedGuarded(
        () {
      runApp(const MyApp());
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
