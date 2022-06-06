import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';
import 'package:music_player/screens/home_screen.dart';
import 'package:music_player/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> _screens = [];
  int _selectedIndex = 0;
  bool _isOpened = false;
  double rotation = 0.0;
  double offset = 0.0;

  //controllers
  AnimationController? _controllerA;
  var scaleAnimation;

  @override
  void initState() {
    _screens.add(HomeScreen(onClick: onClick));
    _controllerA = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controllerA!.addListener(() {
      print(scaleAnimation!.value);
      setState(() {
        rotation = -0.15 * scaleAnimation.value;
        offset = 220.0 * scaleAnimation.value;
      });
    });
    scaleAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controllerA!,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controllerA?.dispose();
    super.dispose();
  }

  void onClick() {
    setState(() {
      _isOpened = !_isOpened;
    });
    if (_controllerA!.isCompleted) {
      _controllerA!.reverse();
    } else {
      _controllerA!.forward(from: 0.0);
    }
  }

  void setScreen(int index) {
    if (index > _screens.length) return;
    setState(() => _selectedIndex = index);
  }

  Widget getCurrentScreen() =>
      _screens.isNotEmpty ? _screens[_selectedIndex] : const Text("loading");

  @override
  Widget build(BuildContext context) {
    print(_isOpened);
    return Stack(
      children: [
        const NavBar(),
        Transform.translate(
          offset: Offset(offset, 0),
          child: Transform.scale(
            scale: 1,
            child: Transform.rotate(
              angle: rotation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: getCurrentScreen(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
