import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Playlist>> getAllPlaylists() async {
  //TODO: DO IT WIGGA
  final prefs = await SharedPreferences.getInstance();
  final playlistsString = prefs.getString(Constants.playlistKey) ?? "[]";
  return Playlist.decode(playlistsString);
}

void insertPlaylist(Playlist playlist) async {
  final prefs = await SharedPreferences.getInstance();
  final playlistsString = prefs.getString(Constants.playlistKey) ?? "[]";
  final playlists = Playlist.decode(playlistsString);
  playlists.add(playlist);
  final value = Playlist.encode(playlists);
  prefs.setString(Constants.playlistKey, value);
}
