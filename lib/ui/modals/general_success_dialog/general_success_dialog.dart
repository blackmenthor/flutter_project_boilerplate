import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/core/strings/strings.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_success_dialog/di/general_success_dialog_graph.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class GeneralSuccessDialog extends StatelessWidget with InjectableWidget {
  final GeneralSuccessDialogGraph _graph;

  //injected
  ColorPalette colorPalette;
  //injected
  Store<AppState> store;

  String title;
  String message;
  String buttonText;
  VoidCallback onButtonClick;

  GeneralSuccessDialog({
    @required
    this.title,
    @required
    this.message,
    this.buttonText,
    this.onButtonClick,
    GeneralSuccessDialogGraph graph
  }) : this._graph = graph ?? GeneralSuccessDialogGraph() {
    setup();
  }

  @override
  GeneralSuccessDialogGraph graph() => _graph;

  Widget _buildIcon(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: colorPalette.success,
      size: 48.0,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 0.5,
            color: colorPalette.black,
          ),
          GestureDetector(
            onTap: () {
              store.dispatch(NavigateBackAction());
              if (onButtonClick != null) onButtonClick();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              decoration: BoxDecoration(
                  color: colorPalette.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  )
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    buttonText ?? Strings.getString('Messages.OK'),
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 16.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _buildIcon(context),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorPalette.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorPalette.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildButton(context)
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // need to wait for redirect to other page
      child: _buildDialog(context),
    );
  }
}
