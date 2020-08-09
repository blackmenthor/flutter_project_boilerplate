import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_failed_dialog/general_failed_dialog.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';
import 'package:redux/redux.dart';

class GeneralFailedDialogGraph extends Graph<GeneralFailedDialog> {

  GeneralFailedDialogGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the GeneralFailedDialog dependencies from injector to the instance
  @override
  void inject(GeneralFailedDialog subject) {
    subject.colorPalette = getDependency<ColorPalette>();
    subject.store = getDependency<Store<AppState>>();
  }

  // Inside this method, we register all the GeneralFailedDialog dependencies:
  @override
  void register() {
  }
}
