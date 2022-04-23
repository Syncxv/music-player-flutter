import 'package:flutter/material.dart';
import 'package:music_player/models/models.dart';

class SongItem extends StatelessWidget {
  final Song song;
  const SongItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: song.cover != null
                    ? DecorationImage(
                        image: NetworkImage(song.cover as String),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("${song.artist} • ${song.album}"),
            ],
          ),
        ]),
        const Icon(Icons.more_vert)
      ],
    );
  }
}
