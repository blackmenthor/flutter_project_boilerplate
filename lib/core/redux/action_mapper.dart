import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_boilerplate/core/navigation/navigation_destinations.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/navigation/navigation_actions.dart';
import 'package:redux/redux.dart';

// Class responsible for mapping UI actions to Redux actions
class ActionMapper {
  final Store store;

  ActionMapper(this.store);

  void dispatch(dynamic action) => store.dispatch(action);

  featureNotAvailable() => dispatch(ShowDialogAction(destination: FeatureNotAvailableDialogDestination()));

  pressBack() => dispatch(NavigateBackAction());

  logout() {
    dispatch(
      ShowDialogAction(
        destination: LogoutDestination(store: store)
      )
    );
  }

  openDatePicker({
    @required
    Function(DateTime) onDateSelected
  }) {
    dispatch(
      ShowDatePickerAction(
        onDateSelected: onDateSelected
      )
    );
  }

  copyText(BuildContext context, String text) {
    Clipboard.setData(new ClipboardData(text: text));
    dispatch(ShowSnackbarAction(
      text: "Text Copied!",
      context: context
    ));
  }
}