
import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/api.dart';
import 'package:flutter_project_boilerplate/core/api/clients/auth_client.dart';
import 'package:flutter_project_boilerplate/core/controllers/general_controller.dart';
import 'package:flutter_project_boilerplate/core/controllers/kickoff_controller.dart';
import 'package:flutter_project_boilerplate/core/controllers/session_controller.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/core/redux/store.dart';
import 'package:flutter_project_boilerplate/environment_config.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

inject(EnvironmentConfig config) {
  final Injector injector = Injector.appInstance;
  final logger = Logger.create();

  injector.registerSingleton<EnvironmentConfig>((_) => config);
  injector.registerSingleton<ColorPalette>((_) => ColorPalette());
  injector.registerSingleton<AppTextTheme>((_) => AppTextTheme());
  injector.registerSingleton<GlobalKey<NavigatorState>>((_) => GlobalKey<NavigatorState>());
  injector.registerSingleton<Logger>((_) => logger);

  /// we don't want to inject auth client to the `api`, so it won't have cyclic dependency.
  final authClient = AuthClient(
      apiKey: config.apiKey, baseUrl: config.apiUrl, logger: logger);

  injector.registerSingleton<SessionController>((injector) {
    return SessionController(
      authClient: authClient,
      logger: logger,
    );
  });

  injector.registerSingleton<Api>((injector) {
    final logger = injector.getDependency<Logger>();
    final sessionController = injector.getDependency<SessionController>();
    return Api.create(
        apiKey: config.apiKey,
        baseUrl: config.apiUrl,
        logger: logger,
        sessionController: sessionController
    );
  });

  injector.registerSingleton<GeneralController>((injector) {
    final api = injector.getDependency<Api>();
    return GeneralController(
      generalClient: api.generalClient,
      logger: logger,
    );
  });

  // Make sure to create the Store in the end, as the Store creation relies on some dependencies registered above
  injector.registerSingleton<Store<AppState>>((_) => createStore());

  injector.registerSingleton<KickOffController>((injector) {
    final store = injector.getDependency<Store<AppState>>();
    return KickOffController(
        store: store,
    );
  });
}