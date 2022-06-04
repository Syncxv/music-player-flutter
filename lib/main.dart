import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';
import 'package:music_player/screens/home_screen.dart';
import 'package:music_player/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Palette.purpleMain,
        scaffoldBackgroundColor: Palette.purpleMain,
      ),
      home: const MainScreen(),
    );
  }
}
