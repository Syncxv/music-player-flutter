import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/widgets/bruh_list.dart';
import 'package:music_player/widgets/recently_played.dart';
import 'package:music_player/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  final Function onClick;
  const HomeScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150,
          backgroundColor: Colors.transparent,
          // centerTitle: true,
          actions: [
            TopBar(
              onClick: onClick,
            )
          ],
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
            constraints: const BoxConstraints(
              minHeight: 600,
              maxHeight: double.infinity,
            ),
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderThingy(title: "Playlists"),
                PlaylistsContainer(
                  playlists: [
                    // Playlist(
                    //     name: "hi",
                    //     id: 1,
                    //     image: "assets/images/hi.png",
                    //     songs: []),
                    // Playlist(name: "hi", id: 1, songs: []),
                    // Playlist(name: "hi", id: 1, songs: []),
                    // Playlist(name: "hi", id: 1, songs: []),
                    // Playlist(name: "hi", id: 1, songs: []),
                    // Playlist(name: "hi", id: 1, songs: []),
                  ],
                ),
                const HeaderThingy(title: "Recently Played"),
                RecentlyPlayedList(songs: [
                  Song(
                    id: 2,
                    album: "idk",
                    artist: "heh",
                    comment: "none",
                    title: "hehehe",
                    dateCreated: DateTime.now(),
                  ),
                  Song(
                    id: 1,
                    album: "bruh moment",
                    artist: "hidude",
                    comment: "none",
                    title: "a nice song",
                    dateCreated: DateTime.now(),
                  )
                ]),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
