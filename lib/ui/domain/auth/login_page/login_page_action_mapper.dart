import 'package:flutter_project_boilerplate/core/navigation/navigation_destinations.dart';
import 'package:flutter_project_boilerplate/core/redux/action_mapper.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/authentication/authentication_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:redux/redux.dart';

class LoginPageActionMapper extends ActionMapper {
  LoginPageActionMapper(Store store) : super(store);

  goToForgotPassword() {
    featureNotAvailable();
  }

  goToRegister() {
    dispatch(NavigateToNextAction(destination: RegisterPageDestination()));
  }

  submit(String phoneNumber, String password) {
    dispatch(LogInAction(
      phoneNumber: phoneNumber,
      password: password
    ));
  }

}