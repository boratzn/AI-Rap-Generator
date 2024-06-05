import 'dart:convert';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/utility/constants/api_constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ApiService {
  final dio = Dio();

  Future<List<String>?> generateLyric(String prompt) async {
    final gemini = Gemini.instance;
    List<String>? lyrics = [];

    try {
      Candidates? response = await gemini.text(command + prompt,
          generationConfig: GenerationConfig(maxOutputTokens: 250));
      lyrics =
          response?.content?.parts?[0].text?.split('\n').sublist(1, 5).toList();
    } catch (e) {
      print(e.toString());
    }

    return lyrics;
  }

  Future<List<BackingTrackModel>> responseBeats() async {
    const String url = ApiUberduck.baseUrl;

    try {
      final requestData = {
        'name': 'name',
        'genre': 'genre',
        'bpm': 'bpm',
        'uuid': 'uuid',
        'url': 'url',
      };

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiUberduck.apiKey}',
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: requestData,
      );

      if (response.statusCode == 200) {
        List<BackingTrackModel> backingTracks =
            (response.data['backing_tracks'] as List)
                .map((track) => BackingTrackModel.fromJson(track))
                .toList();

        return backingTracks;
      } else {
        throw Exception("Request failed. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<VoiceModel>> fetchVoiceUuids() async {
    try {
      final response = await dio.get(
        ApiUberduck.rapperUrl,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<VoiceModel> voiceDetailsList = [];

        for (int i = 0; i < data.length; i++) {
          final voiceUuidModel = VoicesModel.fromJson(data[i]);
          final voiceDetails = await fetchVoiceDetails(voiceUuidModel);
          voiceDetailsList.add(voiceDetails);
        }
        return voiceDetailsList;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel) async {
    try {
      final response = await dio.get(
        'https://api.uberduck.ai/voices/${voiceUuidModel.voicemodelUuid}/detail',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        final VoiceModel voiceDetailsModel = VoiceModel.fromJson(data);
        return voiceDetailsModel;
      } else {
        throw Exception('Voice details has not been loaded!');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }

  Future<SongModel> responseSong(String? backingTrackUuid,
      String? voiceModelUuid, List<String> lyricsData) async {
    String url = ApiUberduck.freeStyleUrl;
    String apiKey = ApiUberduck.freeStyleApiKey;

    Map<String, dynamic> postData = {
      "backing_track": backingTrackUuid,
      "lyrics": [lyricsData],
      "voicemodel_uuid": voiceModelUuid
    };

    String jsonString = jsonEncode(postData);

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Basic $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonString,
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var createdSong = SongModel.fromJson(jsonResponse);
        return createdSong;
      } else {
        throw Exception('Failed to make the request, ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the request $e');
    }
  }
}
