import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

import '../forgot_password_page_action_mapper.dart';

class ForgotPasswordPageGraph extends Graph<ForgotPasswordPage> {

  ForgotPasswordPageGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the ForgotPasswordPage dependencies from injector to the instance
  @override
  void inject(ForgotPasswordPage subject) {
    // For example: subject.store = getDependency<Store<AppState>>();
    subject.colorPalette = getDependency<ColorPalette>();
    subject.textTheme = getDependency<AppTextTheme>();
    subject.actionMapper = getDependency<ForgotPasswordPageActionMapper>();
  }

  // Inside this method, we register all the ForgotPasswordPage dependencies:
  @override
  void register() {
    registerDependency<ForgotPasswordPageActionMapper>((_) {
      final store = getDependency<Store<AppState>>();
      return ForgotPasswordPageActionMapper(store);
    });
  }
}
