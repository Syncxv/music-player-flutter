import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';
import 'package:music_player/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _screens = [];
  List<Text> _text = const [Text("Home"), Text("Playlists")];
  int _selectedIndex = 0;
  bool _isOpened = false;

  void onClick() {
    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_isOpened);
    return Container(
      decoration: BoxDecoration(
        color: Palette.purpleBg,
      ),
      child: Transform.translate(
        offset: const Offset(220.0, 0),
        child: Transform.scale(
          scale: 0.95,
          child: Transform.rotate(
            angle: -0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: const HomeScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
