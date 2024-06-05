import 'package:ai_rap_generator/product/index.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final ApiService apiService;
  SongBloc(this.apiService) : super(SongInitial()) {
    on<FetchSong>((event, emit) async {
      emit(SongLoading());
      try {
        var song = await apiService.responseSong(
            event.backingTrackUuid, event.voiceModelUuid, event.lyricsData);
        emit(SongLoaded(song: song));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
