import 'package:flutter/cupertino.dart';

class Navigation {
  Navigation._();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static Future<dynamic>? push<T>({required Widget page}) =>
      navigationKey.currentState?.push(materialPageRoute(page));

  static void ofPop(BuildContext context) => Navigator.pop(context);
  static Future<T?>? pushAndRemoveAll<T>({required Widget page}) =>
      navigationKey.currentState
          ?.pushAndRemoveUntil(materialPageRoute(page), (route) => false);
  static Future<T?>? pushReplace<T>({required Widget page}) =>
      navigationKey.currentState?.pushReplacement(materialPageRoute(page));

  static CupertinoPageRoute<T> materialPageRoute<T>(Widget page) =>
      CupertinoPageRoute(builder: (context) => page);
}
