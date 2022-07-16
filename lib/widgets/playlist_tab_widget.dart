import 'package:flutter/material.dart';
import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/palette/palette.dart';

class PlaylistTabBodyIDkMan extends StatelessWidget {
  const PlaylistTabBodyIDkMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaylistWidget(
          boxThingy: Container(
            color: Palette.purpleBg,
          ),
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
  final Widget boxThingy;
  const PlaylistWidget(
      {Key? key, required this.playlist, required this.boxThingy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: LibraryScreenConstnats.padding - 5.0,
        horizontal: LibraryScreenConstnats.padding,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: boxThingy,
          ),
          const SizedBox(
            width: LibraryScreenConstnats.playlistPadding,
          ),
          Text(playlist.name)
        ],
      ),
    );
  }
}
