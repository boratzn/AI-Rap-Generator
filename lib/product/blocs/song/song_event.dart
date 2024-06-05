part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class FetchSong extends SongEvent {
  final String backingTrackUuid;
  final String voiceModelUuid;
  final List<String> lyricsData;

  FetchSong(
      {required this.backingTrackUuid,
      required this.voiceModelUuid,
      required this.lyricsData});
}
