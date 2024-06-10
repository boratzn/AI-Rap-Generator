import 'dart:async';
import 'package:ai_rap_generator/product/index.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SongMixin<T extends StatefulWidget> on State<T> {
  final player = AudioPlayer();
  PlayerState playerState = PlayerState.paused;
  Duration currentPosition = Duration.zero;
  Duration audioDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen(
      (PlayerState state) {
        if (mounted) {
          setState(() {
            playerState = state;
          });
        }
      },
    );

    player.onDurationChanged.listen(
      (Duration duration) {
        audioDuration = duration;
      },
    );

    player.onPositionChanged.listen(
      (Duration p) {
        if (mounted) {
          setState(() {
            currentPosition = p;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
    player.dispose();
  }

  Future<void> play(String url) async {
    await player.play(UrlSource(url));
    setState(() => playerState = PlayerState.playing);
  }

  Future<void> pause() async {
    await player.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future<void> stop() async {
    await player.stop();
    setState(() {
      playerState = PlayerState.stopped;
    });
  }

  void setSource(String url) {
    player.setSource(UrlSource(url));
  }

  void seekToSec(int sec) {
    Duration newPosition = Duration(seconds: sec);
    player.seek(newPosition);
  }

  void fastForwardAudio() {
    final newPosition = currentPosition + Duration(seconds: 15);
    player.seek(newPosition);
  }

  void rewindAudio() {
    final newPosition = currentPosition - Duration(seconds: 15);
    player.seek(newPosition);
  }

  decreaseCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('freeTrial') ?? 2;
    if (counter > 0) {
      await prefs.setInt('freeTrial', counter - 1);
    }
  }

  String getTimeString(int milliseconds) {
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60} ';

    return '$minutes:$seconds';
  }

  Widget get getIcon => playerState == PlayerState.playing
      ? Image.asset(
          Assets.images.song.btnPauseSong.path,
          scale: 2,
        )
      : Image.asset(
          Assets.images.song.btnPlaySong.path,
          scale: 2,
        );
}
