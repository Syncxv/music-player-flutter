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
  AnimationController? _controllerA;
  AnimationController? _controllerB;
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
    _controllerB = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controllerB!.addListener(() {
      setState(() {
        scale = scaleAnimation.value?.toDouble();
      });
    });
    _controllerA!.addListener(() {
      print(mainAnimation!.value);
      setState(() {
        rotation = -0.15 * mainAnimation.value;
        offset = 220.0 * mainAnimation.value;
      });
    });
    mainAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controllerA!,
      reverseCurve: Curves.easeIn,
      curve: Curves.easeOut,
    ));

    scaleAnimation = Tween(
      begin: 1,
      end: 0.90,
    ).animate(CurvedAnimation(
      parent: _controllerB!,
      reverseCurve: Curves.easeIn,
      curve: Curves.easeOut,
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
    if (_controllerB!.isCompleted) {
      _controllerB!.reverse();
    } else {
      _controllerB!.forward(from: 1);
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
        Transform.translate(
          offset: Offset(offset, 0),
          child: Transform.scale(
            scale: scale,
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
