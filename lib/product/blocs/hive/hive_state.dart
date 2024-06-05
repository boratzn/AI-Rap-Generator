part of 'hive_bloc.dart';

@immutable
sealed class HiveState {}

final class HiveInitial extends HiveState {}

final class HiveLoading extends HiveState {}

final class HiveLoaded extends HiveState {
  final List<DataModel> songs;

  HiveLoaded({required this.songs});
}

final class HiveError extends HiveState {
  final String message;

  HiveError({required this.message});
}
