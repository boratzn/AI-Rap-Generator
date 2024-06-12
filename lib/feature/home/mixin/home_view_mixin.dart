import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin HomeViewMixin<T extends StatefulWidget> on State<T> {
  final savedBox = Hive.box<DataModel>('songs');

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
        Navigation.push(page: InAppView());
      }
    }
  }
}
