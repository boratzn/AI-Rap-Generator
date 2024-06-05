import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    super.key,
    required this.title,
    required this.useDecoration,
    required this.onTap,
  });

  final String title;
  final bool useDecoration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: useDecoration ? Color(0xFFFFFFFF) : null,
          image: useDecoration
              ? DecorationImage(
                  image: AssetImage(
                    Assets.images.settings.imgSoundWave.path,
                  ),
                )
              : null,
          gradient: useDecoration ? premiumGradient : null,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: context.normalHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: useDecoration
                    ? CustomTextStyles.textStyleS17W900.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)
                    : CustomTextStyles.textStyleS17W900,
              ),
              useDecoration
                  ? Image.asset(Assets.images.settings.imgPremium.path)
                  : Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
