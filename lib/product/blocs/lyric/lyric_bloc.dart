import 'package:ai_rap_generator/product/index.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lyric_event.dart';
part 'lyric_state.dart';

class LyricBloc extends Bloc<LyricEvent, LyricState> {
  final ApiService apiService;
  LyricBloc(this.apiService) : super(LyricInitial()) {
    on<GenerateLyric>((event, emit) async {
      emit(LyricLoading());
      Future.delayed(Duration(seconds: 8));
      try {
        List<String>? lyric = await apiService.generateLyric(event.prompt);
        emit(LyricLoaded(lyric: lyric ?? []));
      } catch (e) {
        LyricError(message: e.toString());
      }
    });
  }
}
