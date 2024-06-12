import 'package:ai_rap_generator/feature/home/mixin/home_view_mixin.dart';
import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return savedBox.length > 0 ? SongCreatorView() : HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        title: appBarTitle,
        isBackIcon: false,
        isCenterTitle: true,
        isAction: true,
        onMenuPressed: () => Navigation.push(page: SettingsView()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await premiumCheck(context);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: boxDecoration,
                child: Icon(
                  Icons.add,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            context.lowHeightSB,
            Text(
              title,
              style: context.textTheme.headlineLarge!.copyWith(
                  color: Color(0xFFA9A9A9),
                  fontFamily: FontFamily.poppinsRegular),
            ),
            context.lowHeightSB,
            Text(
              subTitle,
              style: context.textTheme.headlineSmall!.copyWith(
                  color: Color(0xFFA9A9A9),
                  fontFamily: FontFamily.poppinsRegular),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
