class VoiceModel {
  List<Sample>? sampleUrl;
  String? voicemodelUuid;
  String? displayName;
  String? imageUrl;

  VoiceModel({
    this.sampleUrl,
    this.voicemodelUuid,
    this.displayName,
    this.imageUrl,
  });

  factory VoiceModel.fromJson(Map<String, dynamic> json) {
    return VoiceModel(
      sampleUrl: json["samples"] == null
          ? []
          : List<Sample>.from(json["samples"]!.map((x) => Sample.fromJson(x))),
      voicemodelUuid: json['voicemodel_uuid'] ?? "",
      displayName: json['display_name'] ?? "",
      imageUrl: json['image_url'] ?? "",
    );
  }
}

class Sample {
  String? url;

  Sample({
    this.url,
  });

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
