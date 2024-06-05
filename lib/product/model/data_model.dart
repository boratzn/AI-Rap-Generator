import 'package:hive_flutter/hive_flutter.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  String songUrl;

  @HiveField(1)
  String title;

  @HiveField(2)
  String imageUrl;

  DataModel({
    required this.songUrl,
    required this.title,
    required this.imageUrl,
  });
}
