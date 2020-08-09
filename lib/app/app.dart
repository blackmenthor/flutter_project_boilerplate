import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/app/di/app_graph.dart';
import 'package:flutter_project_boilerplate/core/controllers/kickoff_controller.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/environment_config.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/welcome_page.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class App extends StatefulWidget with InjectableWidget {
  final AppGraph _graph;

  //injected
  EnvironmentConfig config;

  //injected
  Store<AppState> store;

  //injected
  GlobalKey<NavigatorState> navigatorKey;

  //injected
  ColorPalette colorPalette;

  //injected
  KickOffController kickOffController;

  AppGraph graph() => _graph;

  App([graph]) : this._graph = graph ?? AppGraph() {
    setup();
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>
    with AfterLayoutMixin<App> {
  @override
  void afterFirstLayout(BuildContext context) {
    widget.kickOffController.start();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        navigatorKey: widget.navigatorKey,
        title: widget.config.appName,
        home: Scaffold(
          body: Center(
            child: WelcomePage(),
          ),
        ),
      ),
    );
  }
}
