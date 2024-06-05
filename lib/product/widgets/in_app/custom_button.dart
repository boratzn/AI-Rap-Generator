import 'package:ai_rap_generator/product/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import '../../utility/index.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isClicked,
    required this.onTap,
    this.title,
  });

  final bool isClicked;
  final String? title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330,
        height: 58,
        decoration: BoxDecoration(
            color: Color(0xFF292929),
            borderRadius: BorderRadius.circular(17),
            gradient: isClicked ? premiumGradient : null),
        child: Center(
          child: Text(
            title ?? buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: FontFamily.poppinsRegular,
            ),
          ),
        ),
      ),
    );
  }
}
