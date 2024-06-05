part of 'lyric_bloc.dart';

@immutable
sealed class LyricEvent {}

final class GenerateLyric extends LyricEvent {
  final String prompt;

  GenerateLyric({required this.prompt});
}
