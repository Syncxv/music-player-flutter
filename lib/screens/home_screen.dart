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
        SliverAppBar(
          expandedHeight: 150,
          backgroundColor: Colors.transparent,
          // centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            title: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 3, child: Container()),
                  Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[300],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Wigga Boy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[100],
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Flexible(flex: 1, child: Container())
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 900,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                PlaylistsContainer(
                  playlists: [
                    Playlist(name: "hi", id: 1, songs: []),
                    Playlist(name: "hi", id: 1, songs: []),
                    Playlist(name: "hi", id: 1, songs: []),
                    Playlist(name: "hi", id: 1, songs: []),
                    Playlist(name: "hi", id: 1, songs: []),
                    Playlist(name: "hi", id: 1, songs: []),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
