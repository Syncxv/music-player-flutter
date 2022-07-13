import 'package:flutter/material.dart';
import 'package:music_player/widgets/screen_layout.dart';

class LibraryScreen extends StatefulWidget {
  final Function onClick;

  LibraryScreen({Key? key, required this.onClick}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 0;

  _onClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      onClick: widget.onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Taby(
              name: "Playlist",
              index: 0,
              selectedIndex: _selectedIndex,
              onClick: _onClick,
            ),
            const SizedBox(
              width: 20,
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
        padding: const EdgeInsets.only(bottom: 10.0),
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
