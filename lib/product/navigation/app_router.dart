import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SongCreatorRoute.page),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(page: HomePageRoute.page),
        AutoRoute(page: InAppRoute.page),
        AutoRoute(page: BeatsRoute.page),
        AutoRoute(page: PromptRoute.page),
        AutoRoute(page: GeneratingLyricsRoute.page),
        AutoRoute(page: LyricsRoute.page),
        AutoRoute(page: EditLyricsRoute.page),
        AutoRoute(page: RapperRoute.page),
        AutoRoute(page: SettingsRoute.page)
      ];
}
