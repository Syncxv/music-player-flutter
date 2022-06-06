import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';

class NavBar extends StatelessWidget {
  final Function(int) setScreen;
  const NavBar({Key? key, required this.setScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.purpleBg,
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: const Image(
                  image: NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Hi!",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Text(
                  "Wigga Boy",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            NavItem(
              icon: Icons.home,
              text: "Home",
              onClick: () => setScreen(0),
            ),
            SizedBox(
              height: 20,
            ),
            NavItem(
              icon: Icons.add_road,
              text: "Test",
              onClick: () => setScreen(1),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;
  const NavItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
