import 'package:flutter/material.dart';
import 'package:music_player/palette/palette.dart';

class NavBar extends StatelessWidget {
  final Function(int) setScreen;
  final int index;
  const NavBar({
    Key? key,
    required this.setScreen,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.purpleBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(-25, -15),
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 255, 255, 255).withAlpha(40),
                    blurRadius: 100.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withAlpha(60),
                        blurRadius: 30.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: const Image(
                      image: NetworkImage(
                        'https://cdn.discordapp.com/avatars/549244932213309442/5b3984903ff4d507f93465a1e1d86ec7.webp',
                      ),
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
                  selected: index == 0,
                ),
                const SizedBox(
                  height: 20,
                ),
                NavItem(
                  icon: Icons.add_road,
                  text: "Test",
                  onClick: () => setScreen(1),
                  selected: index == 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                NavItem(
                  icon: Icons.playlist_add,
                  text: "Playlists",
                  onClick: () => setScreen(2),
                  selected: index == 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;
  final bool selected;
  const NavItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Row(
        children: [
          Container(
            decoration: selected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withAlpha(60),
                        blurRadius: 20.0,
                        spreadRadius: 1.5,
                      ),
                    ],
                  )
                : const BoxDecoration(),
            child: Icon(
              icon,
              color: Colors.white,
            ),
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
