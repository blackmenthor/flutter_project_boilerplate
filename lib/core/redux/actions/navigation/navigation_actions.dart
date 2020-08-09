import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/navigation/navigation_destinations.dart';

class NavigateToNextAction {

  NavigateToNextAction({@required this.destination});

  final NavigationDestination destination;

}

class NavigateToNextAndReplaceAction {

  NavigateToNextAndReplaceAction({@required this.destination});

  final NavigationDestination destination;

}

class NavigateToRoot {}

class ShowDialogAction {

  ShowDialogAction({
    @required
    this.destination,
    this.barrierDismissible = true
  });

  final NavigationDestination destination;
  final bool barrierDismissible;

}

class ShowBottomSheetDialogAction {

  ShowBottomSheetDialogAction({
    @required
    this.destination,
    this.barrierDismissible = true,
    this.fullScreen = false
  });

  final NavigationDestination destination;
  final bool barrierDismissible;
  final bool fullScreen;

}

class ShowDatePickerAction {

  final Function(DateTime) onDateSelected;
  final DateTime firstDate;

  ShowDatePickerAction({
     @required
     this.onDateSelected,
     this.firstDate
  });

}

class ShowSnackbarAction {

  final BuildContext context;
  final String text;

  ShowSnackbarAction({
    @required
    this.context,
    @required
    this.text
  });

}

class NavigateBackAction {}
