import 'package:ai_rap_generator/product/utility/constants/index.dart';
import 'package:flutter/material.dart';

class PaymentOptionContainer extends StatelessWidget {
  const PaymentOptionContainer({
    super.key,
    required this.title,
    required this.price,
    required this.onTap,
    required this.isClicked,
  });

  final String title;
  final String price;
  final VoidCallback onTap;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 63,
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            gradient: isClicked ? premiumGradient : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: isClicked
                      ? freeTextStyle.copyWith(color: Colors.white)
                      : freeTextStyle,
                ),
                Text(
                  '\$$price',
                  style: isClicked
                      ? freeTextStyle.copyWith(color: Colors.white)
                      : freeTextStyle,
                ),
              ],
            ),
          )),
    );
  }
}
