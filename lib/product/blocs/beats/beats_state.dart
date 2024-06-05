part of 'beats_bloc.dart';

@immutable
sealed class BeatsState {}

final class BeatsInitial extends BeatsState {}

final class BeatsLoading extends BeatsState {}

final class BeatsLoaded extends BeatsState {
  final List<BackingTrackModel> beats;

  BeatsLoaded({required this.beats});
}

final class BeatsError extends BeatsState {}
