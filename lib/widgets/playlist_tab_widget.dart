import 'package:flutter/material.dart';
import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';

class PlaylistTabBodyIDkMan extends StatelessWidget {
  const PlaylistTabBodyIDkMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaylistWidget(
          playlist: Playlist(
            id: 12,
            name: "hi",
            songs: [],
          ),
        )
      ],
    );
  }
}

class PlaylistWidget extends StatelessWidget {
  final Playlist playlist;
  const PlaylistWidget({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: constants.libraryConstnats.padding - 5.0,
        horizontal: constants.libraryConstnats.padding,
      ),
      child: Row(
        children: [
          const Placeholder(
            fallbackHeight: 50,
            fallbackWidth: 50,
          ),
          SizedBox(
            width: constants.libraryConstnats.playlistPadding,
          ),
          Text(playlist.name)
        ],
      ),
    );
  }
}
