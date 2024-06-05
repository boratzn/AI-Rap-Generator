import 'package:flutter/widgets.dart';

class SettingsModel {
  final String title;
  final bool useDecoration;
  final Widget? page;
  final bool onTap;
  final Uri? uri;

  SettingsModel({
    required this.title,
    required this.useDecoration,
    this.page,
    required this.onTap,
    this.uri,
  });
}
