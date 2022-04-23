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
    return SizedBox(
      height: 150,
      // color: Colors.red[200],
      child: ListView.builder(
          itemCount: playlists.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (ctx, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              margin: const EdgeInsets.only(right: 30),
              width: 150,
            );
          }),
    );
  }
}
