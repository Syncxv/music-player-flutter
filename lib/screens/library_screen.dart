import 'package:flutter/material.dart';
import 'package:music_player/widgets/screen_layout.dart';

class LibraryScreen extends StatelessWidget {
  final Function onClick;
  const LibraryScreen({Key? key, required this.onClick}) : super(key: key);

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
