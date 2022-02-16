import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'config/flavor_config.dart';
import 'config/log_config.dart';
import 'di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  configLogging();
  await Firebase.initializeApp();

  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(baseUrl: 'http://hpg-dev-api.qasoftsolution.com/api/'),
  );

  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
