import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int selectedIdx = 0;

  setIndex(int index) {
    selectedIdx = index;
    notifyListeners();
  }
}
