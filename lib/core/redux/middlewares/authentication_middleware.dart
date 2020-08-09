import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/controllers/session_controller.dart';
import 'package:flutter_project_boilerplate/core/exceptions/user_friendly_exception.dart';
import 'package:flutter_project_boilerplate/core/navigation/navigation_destinations.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/authentication/authentication_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware will intercept every action related to the Authentication actions.
class AuthenticationMiddleware implements MiddlewareClass<AppState> {

  final SessionController sessionController;

  AuthenticationMiddleware({
    @required
    this.sessionController,
  });

  @override
  call(Store store, action, next) {
    if (action is LogInAction) {
      _handleLoginAction(store, action);
    } else if (action is LogInSuccessAction) {
      _handleLogInSuccessAction(store, action);
    } else if (action is LogInFailedAction) {
      _handleLogInFailedAction(store, action);
    } else if (action is LogOutAction) {
      _handleLogoutAction(store, action);
    } else if (action is RegisterAction) {
      _handleRegisterAction(store, action);
    } else if (action is RegisterSuccessAction) {
      _handleRegisterSuccessAction(store, action);
    } else if (action is RegisterFailedAction) {
      _handleRegisterFailedAction(store, action);
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

  Future<void> _handleLoginAction(
      Store<AppState> store, LogInAction action) async {
    try {
      store.dispatch(ShowDialogAction(
          destination: LoadingDialogDestination()
      ));

      final response = await sessionController.login(
          phoneNumber: action.phoneNumber, password: action.password);

      store.dispatch(LogInSuccessAction(
          sessionResponse: response
      ));
    } on UserFriendlyException catch (ex) {
      store.dispatch(LogInFailedAction(exception: ex));
    }
  }

  Future<void> _handleRegisterAction(
      Store<AppState> store, RegisterAction action) async {
    try {
      store.dispatch(ShowDialogAction(
          destination: LoadingDialogDestination()
      ));

      final response = await sessionController.register(
          phoneNumber: action.phoneNumber,
          password: action.password,
          firstName: action.firstName,
          lastName: action.lastName,
          email: action.email,
      );

      store.dispatch(RegisterSuccessAction(
          sessionResponse: response
      ));
    } on UserFriendlyException catch (ex) {
      store.dispatch(RegisterFailedAction(exception: ex));
    }
  }

  Future<void> _handleLogInSuccessAction(
      Store<AppState> store, LogInSuccessAction action) async {
    store.dispatch(
        LoadUserAction(
            sessionResponse: action.sessionResponse
        )
    );
    store.dispatch(NavigateBackAction());

    store.dispatch(ShowDialogAction(
        destination: SuccessDialogDestination(
          title: "Login Success!",
          msg: "Welcome!",
          onOkClick: () {
            store.dispatch(
              NavigateBackAction()
            );
          }
        ),
        barrierDismissible: false
    ));
  }

  Future<void> _handleRegisterSuccessAction(
      Store<AppState> store, RegisterSuccessAction action) async {
    store.dispatch(
      LoadUserAction(
        sessionResponse: action.sessionResponse
      )
    );
    store.dispatch(NavigateBackAction());

    store.dispatch(ShowDialogAction(
        destination: SuccessDialogDestination(
            title: "Registration Success!",
            msg: "Welcome!",
            onOkClick: () {
              store.dispatch(
                  NavigateToRoot()
              );
            }
        ),
        barrierDismissible: false
    ));
  }

  Future<void> _handleLogInFailedAction(
      Store<AppState> store, LogInFailedAction action) async {
    store.dispatch(NavigateBackAction());

    store.dispatch(ShowDialogAction(
        destination: FailedDialogDestination(
          title: "Login Fails!",
          errorMessage: "Wrong phone number or Password!"
        ),
        barrierDismissible: false
    ));
  }

  Future<void> _handleRegisterFailedAction(
      Store<AppState> store, RegisterFailedAction action) async {
    store.dispatch(NavigateBackAction());

    String msg = action.exception.getUserFriendlyMessage();

    store.dispatch(ShowDialogAction(
        destination: FailedDialogDestination(
            title: "Registration Fails!",
            errorMessage: msg
        ),
        barrierDismissible: false
    ));
  }

  Future<void> _handleLogoutAction(
      Store<AppState> store, LogOutAction action) async {
    store.dispatch(NavigateToRoot());
    store.dispatch(NavigateToNextAndReplaceAction(
      destination: WelcomePageDestination(),
    ));
  }


}