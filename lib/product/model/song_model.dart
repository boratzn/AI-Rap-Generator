class SongModel {
  String? mixUrl;
  String? title;

  SongModel({
    this.mixUrl,
    this.title,
  });

  SongModel.fromJson(Map<String, dynamic> json) {
    mixUrl = json['mix_url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mix_url'] = mixUrl;
    data['title'] = title;
    return data;
  }
}
