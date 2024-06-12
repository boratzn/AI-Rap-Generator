import 'package:ai_rap_generator/feature/home/view/home_view.dart';
import 'package:ai_rap_generator/feature/inapp/mixin/in_app_view_mixin.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InAppView extends StatefulWidget {
  const InAppView({super.key});

  @override
  State<InAppView> createState() => _InAppViewState();
}

class _InAppViewState extends State<InAppView> with InAppMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        title: '',
        isBackIcon: false,
        isCenterTitle: false,
        icon: Icon(
          Icons.close,
          color: Color(0xFF010101),
        ),
        isAction: true,
        onMenuPressed: () => Navigation.pushReplace(page: HomePageView()),
      ),
      body: Stack(
        children: [
          Image.asset(
            Assets.images.inapp.imgInappBackground.path,
            color: Color(0xFFF1F1F1),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.images.inapp.imgInapp1.path,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Text(
                  isClicked ? premiumTitle : freeTitle,
                  style: CustomTextStyles.textStyleS17W900.copyWith(
                      fontSize: 24,
                      fontFamily: FontFamily.poppinsRegular,
                      color: Color(0xFF010101)),
                ),
              ),
              context.lowHeightSB,
              Padding(
                padding: context.normalHorizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.images.inapp.imgADS.path),
                        context.lowWidthSB,
                        Text(adsText, style: subTitleTextStyle),
                      ],
                    ),
                    context.lowHeightSB,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.images.inapp.imgSpeaker.path),
                        context.lowWidthSB,
                        Text(
                          speakerText,
                          style: subTitleTextStyle,
                        ),
                      ],
                    ),
                    context.lowHeightSB,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(Assets.images.inapp.imgT.path),
                          context.lowWidthSB,
                          Text(
                            isClicked ? tPremiumText : tText,
                            style: subTitleTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              context.lowHeightSB,
              ...buildPaymentOptions,
              context.lowHeightSB,
              CustomButton(
                isClicked: isClicked,
                onTap: () async {
                  if (isClicked) {
                    await getPremium(context);
                  }
                },
              ),
              Padding(
                padding: context.normalHorizontalPadding,
                child: Row(
                  children: List.generate(
                    footerItems.length,
                    (index) => TextButton(
                      onPressed: launchUrll,
                      child: Text(
                        footerItems[index],
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF010101)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
