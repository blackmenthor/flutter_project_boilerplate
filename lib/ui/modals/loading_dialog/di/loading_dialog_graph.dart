import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/ui/modals/loading_dialog/loading_dialog.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:injector/injector.dart';

class LoadingDialogGraph extends Graph<LoadingDialog> {

  LoadingDialogGraph([Injector injector]) : super(injector);

  // Inside this method, we inject the LoadingDialog dependencies from injector to the instance
  @override
  void inject(LoadingDialog subject) {
    subject.colorPalette = getDependency<ColorPalette>();
  }

  // Inside this method, we register all the LoadingDialog dependencies:
  @override
  void register() {
  }
}
