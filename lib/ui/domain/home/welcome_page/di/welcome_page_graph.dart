import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/welcome_page.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/welcome_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

class WelcomePageGraph extends Graph<WelcomePage> {

  WelcomePageGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the WelcomePage dependencies from injector to the instance
  @override
  void inject(WelcomePage subject) {
    // For example: subject.store = getDependency<Store<AppState>>();
    subject.colorPalette = getDependency<ColorPalette>();
    subject.textTheme = getDependency<AppTextTheme>();
    subject.actionMapper = getDependency<WelcomePageActionMapper>();
  }

  // Inside this method, we register all the WelcomePage dependencies:
  @override
  void register() {
    registerDependency<WelcomePageActionMapper>((Injector injector) {
      return WelcomePageActionMapper(injector.getDependency<Store<AppState>>());
    });
  }
}
