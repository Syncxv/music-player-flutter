import 'package:flutter/material.dart';
import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/palette/palette.dart';
import 'package:music_player/services/playlist.dart';
import 'package:music_player/util/generateId.dart';

class PlaylistTabBodyIDkMan extends StatelessWidget {
  const PlaylistTabBodyIDkMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlists = getAllPlaylists();
    print(playlists);
    return Column(
      children: [
        PlaylistWidget(
          onTap: () {
            insertPlaylist(
              Playlist(
                  dateCreated: DateTime.now(),
                  id: generateId(),
                  name: "hi",
                  songs: []),
            );
          },
          boxThingy: Container(
            color: Palette.purpleBg,
            height: 55,
            width: 55,
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          playlist: Playlist(
            id: 12,
            name: "Create Playlist",
            songs: [],
            dateCreated: DateTime.now(),
          ),
        )
      ],
    );
  }
}

class PlaylistWidget extends StatelessWidget {
  final Playlist playlist;
  final Widget boxThingy;
  final Function onTap;
  const PlaylistWidget(
      {Key? key,
      required this.playlist,
      required this.boxThingy,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
            Text(
              playlist.name,
              style: TextStyle(
                color: Palette.textColorWhite,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
