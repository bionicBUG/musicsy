class LyricsResponse {
  Lyrics? lyrics;

  LyricsResponse.fromJson(Map<String, dynamic> json) {
    Lyrics _lyrics = Lyrics(json['message']['body']['lyrics']);
    lyrics = _lyrics;
  }
}

class Lyrics {
  String? lyrics;

  Lyrics(json) {
    lyrics = json['lyrics_body'];
  }
}
