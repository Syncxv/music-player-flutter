import 'package:flutter/material.dart';
import 'package:music_player/widgets/screen_layout.dart';

class LibraryScreen extends StatelessWidget {
  final Function onClick;
  const LibraryScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        onClick: onClick,
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2.5,
                      color: Colors.grey[300]!,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Text("Playlists"),
              )
            ],
          ),
        ));
  }
}
