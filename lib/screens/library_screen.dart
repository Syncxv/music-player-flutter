import 'package:flutter/material.dart';
import 'package:music_player/widgets/screen_layout.dart';

class LibraryScreen extends StatelessWidget {
  final Function onClick;
  const LibraryScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        onClick: onClick,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: 2.5,
                    color: Color.fromARGB(255, 238, 28, 53),
                    style: BorderStyle.solid,
                  )),
                ),
                child: const Text(
                  "Playlists",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
