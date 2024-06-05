import 'package:ai_rap_generator/product/index.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'beats_event.dart';
part 'beats_state.dart';

class BeatsBloc extends Bloc<BeatsEvent, BeatsState> {
  final ApiService apiService;
  BeatsBloc(this.apiService) : super(BeatsInitial()) {
    on<FetchBeats>(_fetchBeats);
  }

  _fetchBeats(event, emit) async {
    emit(BeatsLoading());
    try {
      List<BackingTrackModel> beats = await apiService.responseBeats();
      emit(BeatsLoaded(beats: beats));
    } catch (e) {
      emit(BeatsError());
    }
  }
}
