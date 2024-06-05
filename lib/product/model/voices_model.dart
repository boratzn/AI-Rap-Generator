class VoicesModel {
  final String voicemodelUuid;

  VoicesModel({required this.voicemodelUuid});

  factory VoicesModel.fromJson(Map<String, dynamic> json) {
    return VoicesModel(
      voicemodelUuid: json['voicemodel_uuid'],
    );
  }
}
