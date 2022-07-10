import 'package:flutter/material.dart';
import 'package:music_player/screens/screens.dart';
import 'package:music_player/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<Widget> _screens = [];
  int _selectedIndex = 0;
  bool _isOpened = false;
  double rotation = 0.0;
  double offset = 0.0;
  double scale = 1;

  //controllers
  late AnimationController _controllerA;
  var mainAnimation;
  var scaleAnimation;

  @override
  void initState() {
    _screens.add(HomeScreen(onClick: onClick));
    _screens.add(TestWdiget(onClick: onClick));
    _screens.add(PlaylistScreen(onClick: onClick));
    _controllerA = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _controllerA.addListener(() {
      _controllerA.value;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onClick() {
    setState(() {
      _isOpened = !_isOpened;
    });
    if (_controllerA.isCompleted) {
      _controllerA.reverse();
    } else {
      _controllerA.forward(from: 0.0);
    }
  }

  void setScreen(int index) {
    print("$index ${_screens.length}");
    if (index > _screens.length) return;
    setState(() => _selectedIndex = index);
    onClick();
  }

  Widget getCurrentScreen() =>
      _screens.isNotEmpty ? _screens[_selectedIndex] : const Text("loading");

  @override
  Widget build(BuildContext context) {
    print("$_isOpened $scale");
    return Stack(
      children: [
        NavBar(setScreen: setScreen, index: _selectedIndex),
        AnimatedBuilder(
          animation: _controllerA,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: Offset(
                  220.0 *
                      _controllerA
                          .drive(CurveTween(curve: Curves.easeInOut))
                          .value,
                  0),
              child: Transform.scale(
                scale: scale,
                child: Transform.rotate(
                  angle: -0.15 *
                      _controllerA
                          .drive(CurveTween(curve: Curves.easeInOut))
                          .value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: getCurrentScreen(),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
