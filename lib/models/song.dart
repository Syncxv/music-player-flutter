import 'dart:convert';

class Song {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String comment;
  final DateTime dateCreated;
  final String? cover;

  Song({
    this.cover,
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.comment,
    required this.dateCreated,
  });

  factory Song.fromJson(Map<String, dynamic> jsonData) {
    return Song(
        id: jsonData['id'],
        title: jsonData['title'],
        album: jsonData['album'],
        artist: jsonData['artist'],
        comment: jsonData['comment'],
        cover: jsonData['cover'],
        dateCreated: jsonData['dateCreated']);
  }

  static Map<String, dynamic> toMap(Song song) {
    return {
      'id': song.id,
      'title': song.title,
      'album': song.album,
      'artist': song.artist,
      'comment': song.comment,
      'cover': song.cover,
      'dateCreated': song.dateCreated
    };
  }

  static String encode(List<Song> songs) => json.encode(
        songs.map<Map<String, dynamic>>((todo) => Song.toMap(todo)).toList(),
      );

  static List<Song> decode(String songs) =>
      (json.decode(songs) as List<dynamic>)
          .map<Song>((item) => Song.fromJson(item))
          .toList();

  static List<Song> dynamicToListSong(List<dynamic> dynamicList) =>
      (dynamicList.map(
        (song) => Song(
            id: song.id,
            title: song.title,
            album: song.album,
            artist: song.artist,
            comment: song.comment,
            cover: song.cover,
            dateCreated: song.dateCreated),
      )).toList();
}
