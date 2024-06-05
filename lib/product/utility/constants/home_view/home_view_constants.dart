import 'package:ai_rap_generator/product/utility/extension/context_extension.dart';
import 'package:flutter/material.dart';

//String constants
final String title = 'Start\nHere';
final String subTitle = 'Generate a rap\nsong';
final String buttonText = 'Share';

//Decoration
final BoxDecoration boxDecoration = BoxDecoration(
  color: Color(0xFFE8455B),
  borderRadius: BorderRadius.circular(100),
);

//Size constants
SizedBox lowSizedBox(BuildContext context) => SizedBox(
      height: context.lowValue,
    );
