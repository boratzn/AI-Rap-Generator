import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/model/onboarding.dart';
import 'package:flutter/material.dart';

/// Content widget for the onboarding page
class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.data,
  });

  /// Onboard page to show
  final OnBoarding data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          data.image,
          height: 400,
        ),
        context.lowHeightSB,
        SizedBox(
          height: 81,
          width: 320,
          child: Text(
            data.title,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 120,
          width: 314,
          child: Text(
            data.description,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
