class TrackDetailsResponse {
  TrackData? track;

  TrackDetailsResponse.fromJson(Map<String, dynamic> json) {
    TrackData _track = TrackData(json['message']['body']['track']);
    track = _track;
  }
}

class TrackData {
  String? name;
  String? id;
  String? album;
  String? artist;
  String? rating;
  String? explicit;

  TrackData(json) {
    name = json['track_name'];
    album = json['album_name'];
    artist = json['artist_name'];
    id = json['track_id'].toString();
    rating = json['track_rating'].toString();
    explicit = json['explicit'] == 1 ? 'True' : 'False';
  }
}
