import 'dart:convert';

import 'package:music_player/models/song.dart';

class Playlist {
  final int id;
  final String? image;
  final String name;
  final List<Song> songs;
  final DateTime dateCreated;

  Playlist({
    required this.id,
    this.image,
    required this.name,
    required this.songs,
    required this.dateCreated,
  });
  factory Playlist.fromJson(Map<String, dynamic> jsonData) {
    return Playlist(
      id: jsonData['id'],
      dateCreated: DateTime.parse(jsonData['dateCreated']),
      name: jsonData['name'],
      songs: Song.dynamicToListSong(Song.decode(jsonData['songs'])),
    );
  }

  static Map<String, dynamic> toMap(Playlist playlist) => {
        'id': playlist.id,
        'name': playlist.name,
        'songs': Song.encode(playlist.songs),
        'dateCreated': playlist.dateCreated.toString(),
      };

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
