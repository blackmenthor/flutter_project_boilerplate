import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/login_page/login_page.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/register_page/register_page.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/welcome_page.dart';
import 'package:flutter_project_boilerplate/ui/modals/feature_not_available_dialog/feature_not_available_dialog.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_failed_dialog/general_failed_dialog.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_success_dialog/general_success_dialog.dart';
import 'package:flutter_project_boilerplate/ui/modals/loading_dialog/loading_dialog.dart';
import 'package:flutter_project_boilerplate/ui/modals/logout_dialog/logout_dialog.dart';
import 'package:redux/redux.dart';

abstract class NavigationDestination {
  Widget buildWidget(BuildContext context);
}

class LogoutDestination extends NavigationDestination {
  Store<AppState> store;

  LogoutDestination({@required this.store});

  @override
  Widget buildWidget(BuildContext context) => LogoutDialog(store: store,);
}

class SuccessDialogDestination extends NavigationDestination {
  final String title;
  final String msg;
  final VoidCallback onOkClick;
  SuccessDialogDestination({@required this.title, @required this.msg,@required this.onOkClick});

  @override
  Widget buildWidget(BuildContext context) => GeneralSuccessDialog(
    title: title,
    message: msg,
    onButtonClick: onOkClick,
  );
}

class FailedDialogDestination extends NavigationDestination {
  final String title;
  final String errorMessage;
  final String buttonText;
  final VoidCallback onTap;
  FailedDialogDestination({@required this.title, @required this.errorMessage, this.buttonText, this.onTap});

  @override
  Widget buildWidget(BuildContext context) => GeneralFailedDialog(
    title: title,
    errorMessage: errorMessage,
    buttonText: buttonText,
    onTap: onTap,
  );
}

class LoadingDialogDestination extends NavigationDestination {
  final String dialogTitle;

  LoadingDialogDestination({this.dialogTitle});
  @override
  Widget buildWidget(BuildContext context) => LoadingDialog(dialogTitle: dialogTitle,);
}

class FeatureNotAvailableDialogDestination extends NavigationDestination {
  @override
  Widget buildWidget(BuildContext context) => FeatureNotAvailableDialog();
}

class WelcomePageDestination extends NavigationDestination {
  @override
  Widget buildWidget(BuildContext context) => WelcomePage();
}

class LoginPageDestination extends NavigationDestination {
  @override
  Widget buildWidget(BuildContext context) => LoginPage();
}

class RegisterPageDestination extends NavigationDestination {
  @override
  Widget buildWidget(BuildContext context) => RegisterPage();
}

class ForgotPasswordPageDestination extends NavigationDestination {
  @override
  Widget buildWidget(BuildContext context) => ForgotPasswordPage();
}

// END OF COMMON