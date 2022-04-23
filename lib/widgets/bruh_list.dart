import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';

class PlaylistsContainer extends StatelessWidget {
  final List<Playlist> playlists;
  const PlaylistsContainer({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      // color: Colors.red[200],
      child: ListView.builder(
          itemCount: playlists.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              width: 150,
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
