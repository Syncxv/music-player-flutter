typedef classTHingy 

class Seralizer {
  static Map<String, dynamic> toMap<T>(T playlist) {
   
 }

  static String encode(List<Playlist> playlists) {
    var listy = playlists
        .map<Map<String, dynamic>>((playlist) => Playlist.toMap(playlist))
        .toList();
    print(listy);
    return json.encode(listy);
  }

  static List<Playlist> decode(String playlistsString) =>
      (json.decode(playlistsString) as List<dynamic>)
          .map<Playlist>((item) => Playlist.fromJson(item))
          .toList();
}