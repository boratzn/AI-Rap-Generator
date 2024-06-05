import 'package:ai_rap_generator/product/index.dart';

extension BoolExtension on VoiceModel {
  bool isEqual(VoiceModel other) {
    if (this == other) {
      return true;
    }
    return false;
  }
}
