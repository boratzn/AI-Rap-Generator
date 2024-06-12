import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/widgets/common/custom_snackbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/index.dart';

mixin SongViewMixin<T extends StatefulWidget> on State<T> {
  final box = Hive.box<DataModel>('songs');
  final player = AudioPlayer();
  bool isClicked = false;

  void setName(String value, TextEditingController controller) {
    setState(() {
      controller.text = value;
    });
  }

  void playAndPause(String songUrl) {
    if (isClicked) {
      setState(() {
        stopSong();
        isClicked = false;
      });
    } else {
      setState(() {
        playSong(songUrl);
        isClicked = true;
      });
    }
  }

  Future<void> playSong(String songUrl) async {
    await player.play(UrlSource(songUrl));
  }

  Future<void> stopSong() async {
    await player.stop();
  }

  Future<void> premiumCheck(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = prefs.getInt('freeTrial') ?? 2;
    bool isPremium = prefs.getBool('isPremium') ?? false;
    if (isPremium) {
      Navigation.push(page: PromptView());
    } else {
      if (count > 0) {
        Navigation.push(page: PromptView());
      } else {
        showToast(
            message:
                'You just can create 2 songs. You need premium account to create unlimited songs');
        Navigation.push(page: InAppView());
      }
    }
  }

  Container customNavBar(BuildContext context) {
    return Container(
      height: 123,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white12,
            Colors.white60,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2, 0.9],
        ),
      ),
    );
  }
}
