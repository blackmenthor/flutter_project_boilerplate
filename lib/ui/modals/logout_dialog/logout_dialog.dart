import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/authentication/authentication_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_prompt_dialog/general_prompt_dialog.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class LogoutDialog extends StatelessWidget {

  final Store<AppState> store;

  LogoutDialog({@required this.store});

  @override
  Widget build(BuildContext context) {
    return GeneralPromptDialog(
      title: "Logout",
      message: "Are you sure you want to logout?",
      negativeButtonText: "No",
      positiveButtonText: "Yes",
      onPositiveBtnClick: () {
        store.dispatch(LogOutAction());
      },
    );
  }
}
