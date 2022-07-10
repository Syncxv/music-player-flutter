import 'package:flutter/material.dart';
import 'package:music_player/widgets/screen_layout.dart';
import 'package:music_player/widgets/top_bar.dart';

class PlaylistScreen extends StatelessWidget {
  final Function onClick;
  const PlaylistScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      onClick: onClick,
      child: const Center(
        child: Text("hey"),
      ),
    );
  }
}
