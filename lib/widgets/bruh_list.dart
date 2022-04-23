import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';

class PlaylistsContainer extends StatelessWidget {
  final List<Playlist> playlists;
  const PlaylistsContainer({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.red[200],
      child: ListView.builder(
          itemCount: playlists.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              color: Colors.black,
              width: 50,
            );
          }),
    );
  }
}
