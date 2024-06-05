// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BeatsRoute.name: (routeData) {
      final args = routeData.argsAs<BeatsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BeatsView(
          key: args.key,
          lyric: args.lyric,
        ),
      );
    },
    EditLyricsRoute.name: (routeData) {
      final args = routeData.argsAs<EditLyricsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditLyricsView(
          key: args.key,
          lyrics: args.lyrics,
        ),
      );
    },
    GeneratingLyricsRoute.name: (routeData) {
      final args = routeData.argsAs<GeneratingLyricsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GeneratingLyricsView(
          key: args.key,
          prompt: args.prompt,
        ),
      );
    },
    GeneratingSongRoute.name: (routeData) {
      final args = routeData.argsAs<GeneratingSongRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GeneratingSongView(
          key: args.key,
          rapper: args.rapper,
          track: args.track,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePageView(),
      );
    },
    InAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InAppView(),
      );
    },
    LyricsRoute.name: (routeData) {
      final args = routeData.argsAs<LyricsRouteArgs>(
          orElse: () => const LyricsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LyricsView(
          key: args.key,
          editLyrics: args.editLyrics,
          lyric: args.lyric,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingView(),
      );
    },
    PromptRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromptView(),
      );
    },
    RapperRoute.name: (routeData) {
      final args = routeData.argsAs<RapperRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RapperView(
          key: args.key,
          beat: args.beat,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    SongCreatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SongCreatorView(),
      );
    },
  };
}

/// generated route for
/// [BeatsView]
class BeatsRoute extends PageRouteInfo<BeatsRouteArgs> {
  BeatsRoute({
    Key? key,
    required List<String> lyric,
    List<PageRouteInfo>? children,
  }) : super(
          BeatsRoute.name,
          args: BeatsRouteArgs(
            key: key,
            lyric: lyric,
          ),
          initialChildren: children,
        );

  static const String name = 'BeatsRoute';

  static const PageInfo<BeatsRouteArgs> page = PageInfo<BeatsRouteArgs>(name);
}

class BeatsRouteArgs {
  const BeatsRouteArgs({
    this.key,
    required this.lyric,
  });

  final Key? key;

  final List<String> lyric;

  @override
  String toString() {
    return 'BeatsRouteArgs{key: $key, lyric: $lyric}';
  }
}

/// generated route for
/// [EditLyricsView]
class EditLyricsRoute extends PageRouteInfo<EditLyricsRouteArgs> {
  EditLyricsRoute({
    Key? key,
    required List<String>? lyrics,
    List<PageRouteInfo>? children,
  }) : super(
          EditLyricsRoute.name,
          args: EditLyricsRouteArgs(
            key: key,
            lyrics: lyrics,
          ),
          initialChildren: children,
        );

  static const String name = 'EditLyricsRoute';

  static const PageInfo<EditLyricsRouteArgs> page =
      PageInfo<EditLyricsRouteArgs>(name);
}

class EditLyricsRouteArgs {
  const EditLyricsRouteArgs({
    this.key,
    required this.lyrics,
  });

  final Key? key;

  final List<String>? lyrics;

  @override
  String toString() {
    return 'EditLyricsRouteArgs{key: $key, lyrics: $lyrics}';
  }
}

/// generated route for
/// [GeneratingLyricsView]
class GeneratingLyricsRoute extends PageRouteInfo<GeneratingLyricsRouteArgs> {
  GeneratingLyricsRoute({
    Key? key,
    required String prompt,
    List<PageRouteInfo>? children,
  }) : super(
          GeneratingLyricsRoute.name,
          args: GeneratingLyricsRouteArgs(
            key: key,
            prompt: prompt,
          ),
          initialChildren: children,
        );

  static const String name = 'GeneratingLyricsRoute';

  static const PageInfo<GeneratingLyricsRouteArgs> page =
      PageInfo<GeneratingLyricsRouteArgs>(name);
}

class GeneratingLyricsRouteArgs {
  const GeneratingLyricsRouteArgs({
    this.key,
    required this.prompt,
  });

  final Key? key;

  final String prompt;

  @override
  String toString() {
    return 'GeneratingLyricsRouteArgs{key: $key, prompt: $prompt}';
  }
}

/// generated route for
/// [GeneratingSongView]
class GeneratingSongRoute extends PageRouteInfo<GeneratingSongRouteArgs> {
  GeneratingSongRoute({
    Key? key,
    required VoiceModel rapper,
    required BackingTrackModel track,
    List<PageRouteInfo>? children,
  }) : super(
          GeneratingSongRoute.name,
          args: GeneratingSongRouteArgs(
            key: key,
            rapper: rapper,
            track: track,
          ),
          initialChildren: children,
        );

  static const String name = 'GeneratingSongRoute';

  static const PageInfo<GeneratingSongRouteArgs> page =
      PageInfo<GeneratingSongRouteArgs>(name);
}

class GeneratingSongRouteArgs {
  const GeneratingSongRouteArgs({
    this.key,
    required this.rapper,
    required this.track,
  });

  final Key? key;

  final VoiceModel rapper;

  final BackingTrackModel track;

  @override
  String toString() {
    return 'GeneratingSongRouteArgs{key: $key, rapper: $rapper, track: $track}';
  }
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InAppView]
class InAppRoute extends PageRouteInfo<void> {
  const InAppRoute({List<PageRouteInfo>? children})
      : super(
          InAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'InAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LyricsView]
class LyricsRoute extends PageRouteInfo<LyricsRouteArgs> {
  LyricsRoute({
    Key? key,
    List<String>? editLyrics,
    List<String>? lyric,
    List<PageRouteInfo>? children,
  }) : super(
          LyricsRoute.name,
          args: LyricsRouteArgs(
            key: key,
            editLyrics: editLyrics,
            lyric: lyric,
          ),
          initialChildren: children,
        );

  static const String name = 'LyricsRoute';

  static const PageInfo<LyricsRouteArgs> page = PageInfo<LyricsRouteArgs>(name);
}

class LyricsRouteArgs {
  const LyricsRouteArgs({
    this.key,
    this.editLyrics,
    this.lyric,
  });

  final Key? key;

  final List<String>? editLyrics;

  final List<String>? lyric;

  @override
  String toString() {
    return 'LyricsRouteArgs{key: $key, editLyrics: $editLyrics, lyric: $lyric}';
  }
}

/// generated route for
/// [OnBoardingView]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromptView]
class PromptRoute extends PageRouteInfo<void> {
  const PromptRoute({List<PageRouteInfo>? children})
      : super(
          PromptRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromptRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RapperView]
class RapperRoute extends PageRouteInfo<RapperRouteArgs> {
  RapperRoute({
    Key? key,
    required BackingTrackModel beat,
    List<PageRouteInfo>? children,
  }) : super(
          RapperRoute.name,
          args: RapperRouteArgs(
            key: key,
            beat: beat,
          ),
          initialChildren: children,
        );

  static const String name = 'RapperRoute';

  static const PageInfo<RapperRouteArgs> page = PageInfo<RapperRouteArgs>(name);
}

class RapperRouteArgs {
  const RapperRouteArgs({
    this.key,
    required this.beat,
  });

  final Key? key;

  final BackingTrackModel beat;

  @override
  String toString() {
    return 'RapperRouteArgs{key: $key, beat: $beat}';
  }
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SongCreatorView]
class SongCreatorRoute extends PageRouteInfo<void> {
  const SongCreatorRoute({List<PageRouteInfo>? children})
      : super(
          SongCreatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SongCreatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
