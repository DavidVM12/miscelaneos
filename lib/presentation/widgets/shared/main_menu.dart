import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Gyroscope', Icons.downloading, '/gyroscope'),
  MenuItem('Accelerometer', Icons.speed, '/accelerometer'),
  MenuItem('Magnetomete', Icons.explore_outlined, '/magnetometer'),
  MenuItem('Gyroscope Ball', Icons.sports_baseball_outlined, '/gyroscope-ball'),
  MenuItem('Compass', Icons.explore, '/compass'),

  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Background process', Icons.storage_rounded, '/db-pokemons'),

  MenuItem('biometric', Icons.fingerprint, '/biometric'),
  //ubication
  MenuItem('Ubication', Icons.pin_drop, '/location'),
  MenuItem('Maps', Icons.map_outlined, '/maps'),
  MenuItem('Controls', Icons.gamepad_outlined, '/controlled-map'),
  //badge
  MenuItem('Badge', Icons.notifications_active_sharp, '/badge'),
  //Ads
  MenuItem('Ad full', Icons.ad_units_rounded, '/ad-fullscreen'),
  MenuItem('Ad reward', Icons.fort_outlined, '/ad-rewarded'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => HomeMenuItem(
              title: item.title, route: item.route, icon: item.icon))
          .toList(),
    );
  }
}

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
      this.bgColors = const [Colors.blue, Colors.blueAccent]});

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
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
