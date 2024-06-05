import 'package:ai_rap_generator/product/index.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

mixin RapperViewMixin<T extends StatefulWidget> on State<T> {
  final player = AudioPlayer();
  int currentIndex = -1;
  bool isClicked = false;
  int selectedRapperIndex = -1;
  late VoiceModel selectedRapper;

  void changeState(int index) async {
    setState(() {
      currentIndex = index;
      isClicked = true;
      selectedRapperIndex = index;
    });
  }

  void play(String beat) async {
    await player.play(UrlSource(beat));
  }

  void selectRapper(VoiceModel rapper) {
    setState(() {
      selectedRapper = rapper;
    });
  }
}
