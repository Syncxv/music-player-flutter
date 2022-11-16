import 'dart:io';

import 'package:music_player/models/models.dart';
import 'package:permission_handler/permission_handler.dart';

Future getAllSongs() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    openAppSettings();
    return false;
  }
  Directory dir = Directory('/storage/emulated/0/');
  String mp3Path = dir.toString();
  print(mp3Path);
  List<FileSystemEntity> _files;
  List<FileSystemEntity> _songs = [];
  _files = dir.listSync(recursive: true, followLinks: false);
  for (FileSystemEntity entity in _files) {
    String path = entity.path;
    if (path.endsWith('.mp3')) _songs.add(entity);
  }

  return _songs;
}
