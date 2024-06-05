import 'package:ai_rap_generator/product/data/onboarding_data.dart';
import 'package:ai_rap_generator/product/widgets/onboarding/content_widget.dart';
import 'package:flutter/material.dart';

mixin OnbOardingMixin<T extends StatefulWidget> on State<T> {
  PageController pageController = PageController(keepPage: true);

  List<Widget> pages = List.generate(
    onboardingData.length,
    (index) {
      var data = onboardingData[index];
      return ContentWidget(data: data);
    },
  );

  Widget buildDot(int index, int currentIndex) {
    return Container(
      width: 20.0,
      height: 5,
      margin: EdgeInsets.only(right: 3.0),
      decoration: BoxDecoration(
        color: Color(0xFF555555),
        borderRadius: BorderRadius.circular(5),
        gradient: currentIndex == index
            ? LinearGradient(
                colors: [Color(0xFFEE5266), Color(0xFFDC2D96)],
              )
            : null,
      ),
    );
  }
}
