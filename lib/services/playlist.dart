import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Playlist> getAllPlaylists() async {
  //TODO: DO IT WIGGA
  final prefs = await SharedPreferences.getInstance();
  final wigga = await prefs.getString(Constants.playlistKey);
  if (wigga == null) {
    print("woah something went wrong please look at me");
    return [] as Future<Playlist>;
  }

  return [] as Future<Playlist>;
}
