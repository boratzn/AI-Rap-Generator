import 'package:flutter/material.dart';

class OnboardingViewmodel extends ChangeNotifier {
  int currIndex = 0;

  void changeIndex(int index) {
    currIndex = index;
    notifyListeners();
  }
}
