import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';
import 'package:music_player/screens/home_screen.dart';
import 'package:music_player/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [const HomeScreen()];
  final List<Text> _text = const [Text("Home"), Text("Playlists")];
  int _selectedIndex = 0;
  bool _isOpened = false;

  void onClick() {
    setState(() {
      _isOpened = !_isOpened;
    });
  }

  Widget getCurrentScreen() =>
      _screens.isNotEmpty ? _screens[_selectedIndex] : const Text("loading");

  @override
  Widget build(BuildContext context) {
    print(_isOpened);
    return _isOpened
        ? Stack(
            children: [
              const NavBar(),
              Transform.translate(
                offset: const Offset(220.0, 0),
                child: Transform.scale(
                  scale: 0.95,
                  child: Transform.rotate(
                    angle: -0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: getCurrentScreen(),
                    ),
                  ),
                ),
              ),
            ],
          )
        : getCurrentScreen();
  }
}
