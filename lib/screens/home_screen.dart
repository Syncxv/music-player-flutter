import 'package:flutter/material.dart';
import 'package:music_player/constants/index.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/services/playlist.dart';
import 'package:music_player/widgets/bruh_list.dart';
import 'package:music_player/widgets/recently_played.dart';
import 'package:music_player/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  final Function onClick;
  final Function setScreen;
  const HomeScreen({Key? key, required this.onClick, required this.setScreen})
      : super(key: key);

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
              minHeight: 1000,
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
                HeaderThingy(
                  title: "Playlists",
                  onTap: () {
                    setScreen(Constants.screenIndexes.library, false);
                  },
                ),
                FutureBuilder(
                  future: getAllPlaylists(),
                  builder: (context, AsyncSnapshot<List<Playlist>> snapshot) {
                    return PlaylistsContainer(
                      playlists: snapshot.data ?? [],
                    );
                  },
                ),
                HeaderThingy(
                  title: "Recently Played",
                  onTap: () {},
                ),
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
