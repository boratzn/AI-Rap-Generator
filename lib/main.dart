import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/providers/lyric_provider.dart';
import 'package:ai_rap_generator/product/providers/song_creator/index_provider.dart';
import 'package:ai_rap_generator/product/service/database_service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'product/index.dart';

void main() async {
  bool seenOnboarding = await ApplicationInitialize().initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BeatsBloc(ApiService())),
        BlocProvider(create: (_) => RapperBloc(ApiService())),
        BlocProvider(
          create: (context) => SongBloc(ApiService()),
        ),
        BlocProvider(
          create: (context) => LyricBloc(ApiService()),
        ),
        BlocProvider(
          create: (context) => HiveBloc(HiveService()),
        )
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => OnboardingViewmodel(),
          ),
          ChangeNotifierProvider(
            create: (context) => LyricProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => IndexProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TimerProvider(),
          )
        ],
        child: MainApp(
          seenOnboarding: seenOnboarding,
        ),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.seenOnboarding,
  });

  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.navigationKey,
      debugShowCheckedModeBanner: false,
      home: seenOnboarding ? const HomePageView() : const OnBoardingView(),
    );
  }
}
