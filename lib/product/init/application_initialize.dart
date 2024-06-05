import 'dart:async';
import 'dart:io';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ApplicationInitialize {
  Future<bool> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
    Gemini.init(apiKey: 'AIzaSyDNp4OL1KOI1sVk3T1lyxTtMhbDTQHaTq8');
    await localDbInit();

    return seenOnboarding;
  }

  Future<void> localDbInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DataModelAdapter());

    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.openBox<DataModel>('songs');
  }
}
