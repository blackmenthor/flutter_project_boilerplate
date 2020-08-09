import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

class KickOffController {

  final Store<AppState> store;

  KickOffController({
    @required
    this.store,
  });

  void start() async {
    // do what you need to do on app start
  }

}