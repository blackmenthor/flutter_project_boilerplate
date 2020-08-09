import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/strings/strings.dart';
import 'package:flutter_project_boilerplate/ui/modals/loading_dialog/di/loading_dialog_graph.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

// ignore: must_be_immutable
class LoadingDialog extends StatelessWidget with InjectableWidget {
    final LoadingDialogGraph _graph;

    //injected
    ColorPalette colorPalette;

    final String dialogTitle;

    LoadingDialog({
      this.dialogTitle,
      LoadingDialogGraph graph
    }): this._graph = graph ?? LoadingDialogGraph() {
      setup();
    }

    @override
    LoadingDialogGraph graph() => _graph;

    Widget _buildProgressIndicator(BuildContext context) {
      return SizedBox(
        height: 44.0,
        width: 44.0,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                colorPalette.primary
            ),
          ),
        ),
      );
    }

    Widget _buildText(BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            dialogTitle ?? Strings.getString("LoadingDialog.Title"),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300
            ),
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            content: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _buildProgressIndicator(context),
                      _buildText(context)
                    ],
                )
            ),
        );
    }
}
