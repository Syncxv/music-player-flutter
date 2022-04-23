import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/widgets/glass_mophisim.dart';

class PlaylistsContainer extends StatelessWidget {
  final List<Playlist> playlists;
  const PlaylistsContainer({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      // color: Colors.red[200],
      child: ListView.builder(
          itemCount: playlists.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                image: playlists[index].image != null
                    ? DecorationImage(
                        image: AssetImage(playlists[index].image as String),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
              margin: const EdgeInsets.only(right: 30),
              width: 160,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10.0,
                    left: 10,
                    child: GlassMorphsim(
                      blur: 4,
                      opacity: 0.25,
                      color: Color.fromARGB(255, 26, 26, 26),
                      child: SizedBox(
                        height: 50,
                        width: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    playlists[index].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 3),
                                      child: Icon(
                                        Icons.music_note,
                                        color: Colors.grey[300],
                                        size: 15,
                                      ),
                                    ),
                                    Text(
                                      "${playlists[index].songs.length} Tracks",
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class HeaderThingy extends StatelessWidget {
  final String title;
  const HeaderThingy({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "See More",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
