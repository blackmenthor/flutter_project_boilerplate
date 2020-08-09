import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/strings/strings.dart';
import 'package:flutter_project_boilerplate/ui/modals/general_failed_dialog/general_failed_dialog.dart';

// ignore: must_be_immutable
class FeatureNotAvailableDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GeneralFailedDialog(
      title: Strings.getString("FeatureNotAvailableDialog.Title"),
      errorMessage: Strings.getString("FeatureNotAvailableDialog.Message"),
    );
  }
}
