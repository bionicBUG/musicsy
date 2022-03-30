class GetTracksResponse{
  List<Tracks> tracks = [];


  GetTracksResponse.fromJson(Map<String, dynamic> json) {
    List<Tracks> temp = [];
    for (int i = 0; i < json['message']['body']['track_list'].length; i++) {
      Tracks tracks = Tracks(json['message']['body']['track_list'][i]['track']);
      temp.add(tracks);
    }
    tracks = temp;
  }
}

class Tracks {
  String? name;
  String? id;
  String? album;
  String? artist;

  Tracks(json) {
    name = json['track_name'];
    album = json['album_name'];
    artist = json['artist_name'];
    id = json['track_id'].toString();
  }
}