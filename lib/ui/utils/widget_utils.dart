import 'package:flutter/material.dart';

// Extension functions on NavigatorState
extension NavState on NavigatorState {
  // Navigates back if possible
  void popNavigator() {
    if (this.canPop()) this.pop();
  }
}