import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                print("hi");
              },
              icon: const Icon(Icons.menu_sharp)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
