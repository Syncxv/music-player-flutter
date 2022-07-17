import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Playlist> prefGetAllPlaylists(SharedPreferences prefs) {
  final playlistsString = prefs.getString(Constants.playlistKey) ?? "[]";
  return Playlist.decode(playlistsString);
}

Future<List<Playlist>> getAllPlaylists() async {
  final prefs = await SharedPreferences.getInstance();
  final playlistsString = prefs.getString(Constants.playlistKey) ?? "[]";
  return Playlist.decode(playlistsString);
}

void insertPlaylist(Playlist playlist) async {
  final prefs = await SharedPreferences.getInstance();
  final playlists = prefGetAllPlaylists(prefs);
  playlists.add(playlist);
  prefs.setString(Constants.playlistKey, Playlist.encode(playlists));
}

void deletePlaylist(int id) async {
  final prefs = await SharedPreferences.getInstance();
  final playlists = prefGetAllPlaylists(prefs);
  playlists.removeWhere((element) => element.id == id);
  prefs.setString(Constants.playlistKey, Playlist.encode(playlists));
}
