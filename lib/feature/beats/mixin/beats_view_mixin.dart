import 'package:ai_rap_generator/product/index.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

mixin BeatsViewMixin<T extends StatefulWidget> on State<T> {
  bool isClicked = false;
  int currentIndex = -1;
  late BackingTrackModel selectedBeat;
  final player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
    player.dispose();
  }

  void changeState(int index, BackingTrackModel beat) async {
    setState(() {
      isClicked = true;
      currentIndex = index;
      selectedBeat = beat;
    });
    await player.play(UrlSource(beat.url));
  }
}
