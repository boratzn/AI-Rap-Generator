class ApiChatGpt {
  static const String baseUrl =
      'https://api.gemini.com/v1/engines/text-davinci-001/completions';
  static const String apiKey =
      'sk-my-service-account-PG1tmNquYUCsARpHpRfvT3BlbkFJsqYXmG5oixUj7ZKQCEwm';
}

class ApiUberduck {
  static const String baseUrl =
      "https://api.uberduck.ai/reference-audio/backing-tracks?detailed=true";
  static const String apiKey = 'pk_e26ee974-a4e5-4a3d-be11-dfbe61d6bf8d';

  static const String freeStyleUrl = 'https://api.uberduck.ai/tts/freestyle';
  static const String freeStyleApiKey =
      'cHViX2Rzamtqb25qdnd2a2JycXF1Zjpwa19jNWI1MmYwYi00MmFmLTQyZTItODFhNS1hOTQ0MDg3YWIzMGY=';
  static const String rapperUrl =
      'https://api.uberduck.ai/voices?mode=tts-rap&language=english&is_commercial=true';
}
