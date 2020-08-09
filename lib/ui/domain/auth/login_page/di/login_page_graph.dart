import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/login_page/login_page.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

import '../login_page_action_mapper.dart';

class LoginPageGraph extends Graph<LoginPage> {

  LoginPageGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the LoginPage dependencies from injector to the instance
  @override
  void inject(LoginPage subject) {
    // For example: subject.store = getDependency<Store<AppState>>();
    subject.colorPalette = getDependency<ColorPalette>();
    subject.textTheme = getDependency<AppTextTheme>();
    subject.actionMapper = getDependency<LoginPageActionMapper>();
  }

  // Inside this method, we register all the LoginPage dependencies:
  @override
  void register() {
    registerDependency<LoginPageActionMapper>((_) {
      final store = getDependency<Store<AppState>>();
      return LoginPageActionMapper(store);
    });
  }
}
