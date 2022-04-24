import 'package:flutter/cupertino.dart';
import 'package:music_player/models/models.dart';
import 'package:music_player/widgets/widgets.dart';

class RecentlyPlayedList extends StatelessWidget {
  final List<Song> songs;
  const RecentlyPlayedList({
    Key? key,
    required this.songs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: songs.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SongItem(song: songs[index]),
        ),
      ),
    );
  }
}
