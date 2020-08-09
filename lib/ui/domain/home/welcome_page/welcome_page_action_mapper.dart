import 'package:flutter_project_boilerplate/core/navigation/navigation_destinations.dart';
import 'package:flutter_project_boilerplate/core/redux/action_mapper.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:redux/redux.dart';

class WelcomePageActionMapper extends ActionMapper {
  WelcomePageActionMapper(Store store) : super(store);

  goToHome() {
    featureNotAvailable();
  }

  goToLogin() {
    dispatch(NavigateToNextAction(
      destination: LoginPageDestination()
    ));
  }

}