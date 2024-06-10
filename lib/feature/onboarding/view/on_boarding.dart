import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/feature/onboarding/mixin/onboarding_mixin.dart';
import 'package:ai_rap_generator/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingView> with OnbOardingMixin {
  @override
  Widget build(BuildContext context) {
    int currIndex = context.watch<OnboardingViewmodel>().currIndex;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                context.read<OnboardingViewmodel>().changeIndex(index);
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) {
                return buildDot(index, currIndex);
              },
            ),
          ),
          SizedBox(
            height: 37,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ButtonWidget(
                onTap: () async {
                  if (currIndex == (onboardingData.length - 1)) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('seenOnboarding', true);
                    await prefs.setInt('freeTrial', 2);
                    Navigation.pushReplace(context: context, page: InAppView());
                  }
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                length: onboardingData.length,
                currIndex: currIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
