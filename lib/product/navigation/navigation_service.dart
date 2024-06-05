import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation {
  Navigation._();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static Future<dynamic> push<T>(
          {required BuildContext context, required Widget page}) =>
      Navigator.push(context, materialPageRoute(page));

  static void ofPop(BuildContext context) => Navigator.pop(context);
  static Future<T?>? pushAndRemoveAll<T>({required Widget page}) =>
      navigationKey.currentState
          ?.pushAndRemoveUntil(materialPageRoute(page), (route) => false);
  static Future<T?>? pushReplace<T>(
          {required BuildContext context, required Widget page}) =>
      Navigator.pushReplacement(context, materialPageRoute(page));

  static CupertinoPageRoute<T> materialPageRoute<T>(Widget page) =>
      CupertinoPageRoute(builder: (context) => page);
}
