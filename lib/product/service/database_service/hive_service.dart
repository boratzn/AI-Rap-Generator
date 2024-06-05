import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  final box = Hive.box<DataModel>('songs');

  Future<void> saveSong(DataModel song) async {
    box.add(song);
  }

  Future<List<DataModel>> getAllSongs() async {
    return box.values.toList();
  }

  Future<void> deleteSong(int index) async {
    box.deleteAt(index);
  }

  Future<void> updateSong(DataModel song, int index) async {
    box.putAt(index, song);
  }
}
