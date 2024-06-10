part of 'song_bloc.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongLoaded extends SongState {
  final SongModel song;

  SongLoaded({required this.song});
}

final class SongError extends SongState {
  final String message;

  SongError({required this.message});
}
