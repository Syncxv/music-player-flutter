import 'package:flutter/material.dart';
import 'package:music_player/widgets/top_bar.dart';

class TestWdiget extends StatelessWidget {
  final Function onClick;
  const TestWdiget({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: Colors.transparent,
            // centerTitle: true,
            actions: [
              TopBar(
                onClick: onClick,
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Text("HI THERE"),
            ),
          )
        ],
      ),
    );
  }
}
