import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/app/app.dart';
import 'package:flutter_project_boilerplate/core/controllers/kickoff_controller.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/environment_config.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

class AppGraph extends Graph<App> {
  AppGraph([Injector injector]) : super(injector);

  @override
  void inject(App subject) {
    subject.config = getDependency<EnvironmentConfig>();
    subject.store = getDependency<Store<AppState>>();
    subject.navigatorKey = getDependency<GlobalKey<NavigatorState>>();
    subject.colorPalette = getDependency<ColorPalette>();
    subject.kickOffController = getDependency<KickOffController>();
  }

  // Inside this method, we register all the `App` dependencies:
  @override
  void register() {}
}
