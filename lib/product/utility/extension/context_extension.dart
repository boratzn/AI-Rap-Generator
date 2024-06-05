import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowValue);
  EdgeInsets get normalPadding => EdgeInsets.all(normalValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get highPadding => EdgeInsets.all(highValue);

  EdgeInsets get lowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get normalHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get mediumHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get highHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get lowVerticalPadding => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get normalVerticalPadding =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get mediumVerticalPadding =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get highVerticalPadding =>
      EdgeInsets.symmetric(vertical: highValue);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension SizedBoxExtension on BuildContext {
  SizedBox get lowHeightSB => SizedBox(height: lowValue);
  SizedBox get normalHeightSB => SizedBox(height: normalValue);
  SizedBox get mediumHeightSB => SizedBox(height: mediumValue);
  SizedBox get highHeightSB => SizedBox(height: highValue);

  SizedBox get lowWidthSB => SizedBox(width: lowValue);
  SizedBox get normalWidthSB => SizedBox(width: normalValue);
  SizedBox get mediumWidthSB => SizedBox(width: mediumValue);
  SizedBox get highWidthSB => SizedBox(width: highValue);
}
