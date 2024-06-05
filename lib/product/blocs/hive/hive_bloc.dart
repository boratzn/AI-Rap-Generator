import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/service/database_service/hive_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hive_event.dart';
part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  final HiveService hiveService;
  HiveBloc(this.hiveService) : super(HiveInitial()) {
    on<GetAllSongs>((event, emit) async {
      emit(HiveLoading());
      try {
        List<DataModel> songs = await hiveService.getAllSongs();
        emit(HiveLoaded(songs: songs));
      } catch (e) {
        emit(HiveError(message: e.toString()));
      }
    });

    on<AddSong>((event, emit) async {
      try {
        await hiveService.saveSong(event.song);
        emit(HiveLoaded(songs: await hiveService.getAllSongs()));
      } catch (e) {
        //Alert
      }
    });

    on<DeleteSong>((event, emit) async {
      try {
        await hiveService.deleteSong(event.index);
        emit(HiveLoaded(songs: await hiveService.getAllSongs()));
      } catch (e) {
        //Alert
      }
    });

    on<UpdateSong>((event, emit) async {
      try {
        await hiveService.updateSong(event.song, event.index);
        emit(HiveLoaded(songs: await hiveService.getAllSongs()));
      } catch (e) {
        //Alert dialog
      }
    });
  }
}
