import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:flutter_project_boilerplate/core/exceptions/user_friendly_exception.dart';

class LogInAction {
  final String phoneNumber;
  final String password;

  LogInAction({
    @required
    this.phoneNumber,
    @required
    this.password,
  });
}

class RegisterAction {
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;
  final String email;

  RegisterAction({
    @required
    this.phoneNumber,
    @required
    this.password,
    @required
    this.firstName,
    @required
    this.lastName,
    this.email,
  });
}

class LogInSuccessAction {
  final SessionResponse sessionResponse;

  LogInSuccessAction({
    @required this.sessionResponse
  });
}

class RegisterSuccessAction {
  final SessionResponse sessionResponse;

  RegisterSuccessAction({
    @required this.sessionResponse
  });
}

class LogInFailedAction {
  final UserFriendlyException exception;

  LogInFailedAction({
    @required this.exception
  });
}

class RegisterFailedAction {
  final UserFriendlyException exception;

  RegisterFailedAction({
    @required this.exception
  });
}

class LogOutAction {}

class LoadUserAction {
  final SessionResponse sessionResponse;

  LoadUserAction({@required this.sessionResponse});

}