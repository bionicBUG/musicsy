import 'dart:convert';
import 'dart:developer';

import 'package:music_match_api_app/data/constants.dart';
import 'package:music_match_api_app/data/models/tracks.dart';
import 'package:http/http.dart' as http;

import '../models/lyrics.dart';

class GetLyricsService {
  Future<LyricsResponse> getLyrics(String id) async {
    final response =
        await http.get(Uri.parse(apiUri + 'track.lyrics.get?track_id=$id&apikey=$apiKey'));
    if (response.statusCode == 200 || response.statusCode == 404) {
      return LyricsResponse.fromJson(json.decode(response.body));
    } else {
      log(response.body);
      throw Exception('Failed to get data.');
    }
  }
}