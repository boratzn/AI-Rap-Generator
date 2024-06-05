import 'package:ai_rap_generator/product/index.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rapper_event.dart';
part 'rapper_state.dart';

class RapperBloc extends Bloc<RapperEvent, RapperState> {
  final ApiService apiService;
  RapperBloc(this.apiService) : super(RapperInitial()) {
    on<FetchRapper>(_fetchRapper);
  }

  _fetchRapper(event, emit) async {
    emit(RapperLoading());
    try {
      List<VoiceModel> rapper = await apiService.fetchVoiceUuids();
      emit(RapperLoaded(rapper));
    } catch (e) {
      emit(RapperError());
    }
  }
}
