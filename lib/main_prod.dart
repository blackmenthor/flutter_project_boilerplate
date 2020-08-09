import 'dart:async';

import 'package:flutter_project_boilerplate/app/app.dart';
import 'package:flutter_project_boilerplate/core/di/injector.dart' as Injector;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_boilerplate/environment_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var config = EnvironmentConfig(
      environment: Environment.STAGING,
      appName: "App Prod",
      apiUrl: "https://prod.app.id",
      apiKey: "xxxxxxxxx"
  );

  Injector.inject(config);

  // The `runZoned` captures errors and allows us to report them into our BE infrastructure
  // Taken from here: https://github.com/flutter/crashy/blob/master/lib/main.dart#L107
  runZoned<Future<Null>>(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(App());
  });
}