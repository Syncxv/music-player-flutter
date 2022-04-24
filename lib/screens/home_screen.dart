import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/widgets/bruh_list.dart';
import 'package:music_player/widgets/recently_played.dart';

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
                    album: "idk",
                    artist: "heh",
                    comment: "none",
                    title: "hehehe",
                    year: 1999,
                  ),
                  Song(
                    album: "bruh moment",
                    artist: "hidude",
                    comment: "none",
                    title: "a nice song",
                    year: 1999,
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
