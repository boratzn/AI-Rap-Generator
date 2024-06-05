import 'package:ai_rap_generator/product/index.dart';
import 'package:flutter/material.dart';

class TransparentBottomOverlayImage extends StatelessWidget {
  final String imageUrl;

  TransparentBottomOverlayImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.fitWidth,
          height: context.height * 0.40,
          width: context.width,
        ),
        Transform.translate(
          offset: const Offset(0.0, 340.0),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  spreadRadius: 60.0,
                  blurRadius: 50.0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
