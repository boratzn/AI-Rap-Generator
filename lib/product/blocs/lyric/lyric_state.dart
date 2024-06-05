part of 'lyric_bloc.dart';

@immutable
sealed class LyricState {}

final class LyricInitial extends LyricState {}

final class LyricLoading extends LyricState {}

final class LyricLoaded extends LyricState {
  final List<String> lyric;

  LyricLoaded({required this.lyric});
}

final class LyricError extends LyricState {
  final String message;

  LyricError({required this.message});
}
