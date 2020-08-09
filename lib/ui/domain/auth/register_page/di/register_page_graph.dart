import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/register_page/register_page.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/register_page/register_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

class RegisterPageGraph extends Graph<RegisterPage> {

  RegisterPageGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the RegisterPage dependencies from injector to the instance
  @override
  void inject(RegisterPage subject) {
    // For example: subject.store = getDependency<Store<AppState>>();
    subject.colorPalette = getDependency<ColorPalette>();
    subject.textTheme = getDependency<AppTextTheme>();
    subject.actionMapper = getDependency<RegisterPageActionMapper>();
  }

  // Inside this method, we register all the RegisterPage dependencies:
  @override
  void register() {
  registerDependency<RegisterPageActionMapper>((_) {
      final store = getDependency<Store<AppState>>();
      return RegisterPageActionMapper(store);
    });
  }
}
