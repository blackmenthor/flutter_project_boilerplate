import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_project_boilerplate/core/redux/states/app_state/app_state.dart';
import 'package:flutter_project_boilerplate/ui/utils/widget_utils.dart';
import 'package:redux/redux.dart';

/// This middleware will intercept every action related to the Navigation actions.
class NavigationMiddleware implements MiddlewareClass<AppState> {

  final GlobalKey<NavigatorState> navigatorKey;

  NavigationMiddleware({
    @required
    this.navigatorKey,
  });

  @override
  call(Store<AppState> store, action, next) {
    if (action is NavigateToNextAction) {
      _handleNavigateToNextAction(store, action);
    } else if (action is NavigateToNextAndReplaceAction) {
      _handleNavigateToNextAndReplaceAction(store, action);
    } else if (action is NavigateBackAction) {
      _handleNavigateBackAction(store, action);
    } else if (action is ShowDialogAction) {
      _handleShowDialogAction(store, action);
    } else if (action is ShowBottomSheetDialogAction) {
      _handleShowBottomSheetDialogAction(store, action);
    } else if (action is NavigateToRoot) {
      _handleNavigateToRoot(store, action);
    } else if (action is ShowDatePickerAction) {
      _handleDatePicker(store, action);
    } else if (action is ShowSnackbarAction) {
      _handleSnackbar(store, action);
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

  Future<void> _handleNavigateToNextAction(
      Store<AppState> store, NavigateToNextAction action) async {
    navigatorKey.currentState.push(MaterialPageRoute(
        builder: action.destination.buildWidget
    ));
  }

  Future<void> _handleNavigateToNextAndReplaceAction(
      Store<AppState> store, NavigateToNextAndReplaceAction action) async {
    navigatorKey.currentState.pushReplacement(MaterialPageRoute(
        builder: action.destination.buildWidget
    ));
  }

  Future<void> _handleNavigateToRoot(
      Store<AppState> store, NavigateToRoot action) async {
    navigatorKey.currentState.popUntil((route) => route.isFirst);
  }

  Future<void> _handleNavigateBackAction(
      Store<AppState> store, NavigateBackAction action) async {
    navigatorKey.currentState.popNavigator();
  }

  Future<void> _handleShowDialogAction(
      Store<AppState> store, ShowDialogAction action) async {
    showDialog(
        context: navigatorKey.currentState.overlay.context,
        barrierDismissible: action.barrierDismissible,
        builder: action.destination.buildWidget,
    );
  }

  Future<void> _handleShowBottomSheetDialogAction(
      Store<AppState> store, ShowBottomSheetDialogAction action) async {
    showModalBottomSheet(
        context: navigatorKey.currentState.overlay.context,
        isDismissible: action.barrierDismissible,
        backgroundColor: Colors.transparent,
        isScrollControlled: action.fullScreen,
        builder: action.destination.buildWidget,
    );
  }

  Future<void> _handleDatePicker(
      Store<AppState> store, ShowDatePickerAction action) async {
    final DateTime picked = await showDatePicker(
        context: navigatorKey.currentState.overlay.context,
        initialDate: action.firstDate ?? DateTime.now(),
        firstDate: action.firstDate ?? DateTime(2020),
        lastDate: DateTime(2099)
    );

    action.onDateSelected(picked);
  }

  Future<void> _handleSnackbar(
      Store<AppState> store, ShowSnackbarAction action) async {
      Scaffold.of(action.context).showSnackBar(
          SnackBar(
            content: Text(
                action.text
            ),
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 1),
          ),
      );
  }

}
