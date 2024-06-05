class BackingTrackModel {
  double bpm;
  String uuid;
  String name;
  String url;

  BackingTrackModel({
    required this.bpm,
    required this.uuid,
    required this.name,
    required this.url,
  });

  factory BackingTrackModel.fromJson(Map<String, dynamic> json) {
    return BackingTrackModel(
      bpm: json['bpm'].toDouble(),
      uuid: json['uuid'],
      name: json['name'],
      url: json['url'],
    );
  }
}
