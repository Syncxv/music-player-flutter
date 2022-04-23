import 'package:music_player/models/song.dart';

class Playlist {
  final int id;
  final String? image;
  final String name;
  final List<Song> songs;

  Playlist({
    required this.id,
    required this.image,
    required this.name,
    required this.songs,
  });
}
