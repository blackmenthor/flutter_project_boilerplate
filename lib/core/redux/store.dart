import 'package:flutter_project_boilerplate/core/controllers/session_controller.dart';
import 'package:flutter_project_boilerplate/core/redux/middlewares/authentication_middleware.dart';
import 'package:flutter_project_boilerplate/core/redux/reducers/reducer.dart' as Reducer;
import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

import 'middlewares/navigation_middleware.dart';

Store<AppState> createStore() {
  final navigatorKey = Injector.appInstance.getDependency<GlobalKey<NavigatorState>>();
  final sessionController = Injector.appInstance.getDependency<SessionController>();
  return Store<AppState>(
    Reducer.reduce,
    initialState: AppState(),
    middleware: [
      NavigationMiddleware(navigatorKey: navigatorKey),
      AuthenticationMiddleware(sessionController: sessionController)
    ],
  );
}