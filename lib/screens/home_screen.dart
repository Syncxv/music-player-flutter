import 'package:flutter/material.dart';
import 'package:music_player/models/playlist.dart';
import 'package:music_player/widgets/bruh_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PlaylistsContainer(
            playlists: [Playlist(name: "hi", id: 1, songs: [])],
          ),
        )
      ],
    ));
  }
}
