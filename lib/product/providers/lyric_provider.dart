import 'package:flutter/material.dart';

class LyricProvider extends ChangeNotifier {
  List<String> _lyricList = [];

  List<String> get lyricList => _lyricList;

  void setLyrics(List<String> lyrics) {
    _lyricList = lyrics;
    notifyListeners();
  }
}
