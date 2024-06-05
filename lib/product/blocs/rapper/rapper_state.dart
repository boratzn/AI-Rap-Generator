part of 'rapper_bloc.dart';

@immutable
sealed class RapperState {}

final class RapperInitial extends RapperState {}

final class RapperLoading extends RapperState {}

final class RapperLoaded extends RapperState {
  final List<VoiceModel>? rappers;

  RapperLoaded(this.rappers);
}

final class RapperError extends RapperState {}
