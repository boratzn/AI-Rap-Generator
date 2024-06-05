part of 'hive_bloc.dart';

@immutable
sealed class HiveEvent {}

final class GetAllSongs extends HiveEvent {}

final class AddSong extends HiveEvent {
  final DataModel song;

  AddSong({required this.song});
}

final class UpdateSong extends HiveEvent {
  final DataModel song;
  final int index;

  UpdateSong({required this.song, required this.index});
}

final class DeleteSong extends HiveEvent {
  final int index;

  DeleteSong({required this.index});
}
