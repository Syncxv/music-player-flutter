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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PlaylistWidget(
          onTap: () {
            print("Creating playlist");
            insertPlaylist(
              Playlist(
                  dateCreated: DateTime.now(),
                  id: generateId(),
                  name: "hi",
                  songs: []),
            );
          },
          boxThingy: Container(
            color: Palette.purplePlaylistBg,
            height: LibraryScreenConstnats.playlistPicutreSize,
            width: LibraryScreenConstnats.playlistPicutreSize,
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          playlist: Playlist(
            id: -1,
            name: "Create Playlist",
            songs: [],
            dateCreated: DateTime.now(),
          ),
        ),
        FutureBuilder(
          future: getAllPlaylists(),
          builder: (context, AsyncSnapshot<List<Playlist>> snapshot) {
            final bruh = snapshot.data?.map((playlist) {
              return PlaylistWidget(
                playlist: playlist,
                boxThingy: PlaylistImage(
                  image: playlist.image,
                ),
                onTap: () {
                  print("cool playlist $playlist");
                },
              );
            }).toList();
            if (bruh == null) {
              return const Text("create a playlist bruh");
            }

            return Column(
              children: bruh,
            );
          },
        ),
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
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
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

class PlaylistImage extends StatelessWidget {
  final String? image;
  const PlaylistImage({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: LibraryScreenConstnats.playlistPicutreSize,
      width: LibraryScreenConstnats.playlistPicutreSize,
      child: image != null
          ? Image.network(image!)
          : Container(
              color: Palette.purplePlaylistBg,
              child: const Icon(
                Icons.music_note,
                color: Colors.white,
              ),
            ),
    );
  }
}
