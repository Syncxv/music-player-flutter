import 'package:flutter/material.dart';
import 'package:music_player/constants/index.dart';
import 'package:music_player/widgets/playlist_tab_widget.dart';
import 'package:music_player/widgets/screen_layout.dart';

class LibraryScreen extends StatefulWidget {
  final Function onClick;

  const LibraryScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const PlaylistTabBodyIDkMan(),
    Container() //TODO: do the aritsts section wigga
  ];

  _onClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      onClick: widget.onClick,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: constants.libraryConstnats.padding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Taby(
                  name: "Playlist",
                  index: 0,
                  selectedIndex: _selectedIndex,
                  onClick: _onClick,
                ),
                SizedBox(
                  width: constants.libraryConstnats.padding,
                ),
                Taby(
                  name: "Artists",
                  index: 1,
                  selectedIndex: _selectedIndex,
                  onClick: _onClick,
                ),
              ],
            ),
          ),
          screens[_selectedIndex],
        ],
      ),
    );
  }
}

class Taby extends StatelessWidget {
  final String name;
  final int index;
  final int selectedIndex;
  final Function(int) onClick;

  const Taby({
    Key? key,
    required this.name,
    required this.index,
    required this.selectedIndex,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(index);
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: constants.libraryConstnats.tabBorderPadding,
        ),
        decoration: index == selectedIndex
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2.5,
                    color: Color.fromARGB(255, 238, 28, 53),
                    style: BorderStyle.solid,
                  ),
                ),
              )
            : const BoxDecoration(),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
