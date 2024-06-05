import 'package:flutter/material.dart';

///Common button widget for onBoarding page
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.length,
    required this.currIndex,
  });

  /// Callback function for button
  final VoidCallback onTap;

  /// onBoarding pages count
  final int length;

  /// index control for button title and function
  final int currIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: LinearGradient(
          colors: [Color(0xFFEE5266), Color(0xFFDC2D96)],
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            currIndex == (length - 1) ? "Start" : "Next",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
