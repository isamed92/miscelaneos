import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: menuItems
            .map((e) =>
                HomeMenuItem(title: e.title, route: e.route, icon: e.icon))
            .toList());
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;

  _MenuItem(this.title, this.icon, this.route);
}

final menuItems = <_MenuItem>[
  _MenuItem('Giroscopio', Icons.downloading, '/gyroscope'),
  _MenuItem('Acelerometro', Icons.speed, '/acelerometer'),
  _MenuItem('Magnetrometo', Icons.explore_outlined, '/magnetometer'),
  _MenuItem('Brujula', Icons.sports_volleyball, '/compass'),
  _MenuItem('Giroscopio', Icons.explore, '/gyroscope-ball'),
  _MenuItem('Pokemon', Icons.catching_pokemon, '/pokemon'),
];

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.route,
      required this.icon,
      this.bgColors = const [Colors.lightBlue, Colors.blue]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Colors.white, size: 45),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
