import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';

class HomeNavBottom extends StatelessWidget {
  HomeNavBottom({super.key});

  final Map<int, dynamic> data = {
    1: {'icon': Icons.store_outlined, 'label': LocaleKeys.home},
    2: {'icon': Icons.dashboard_outlined, 'label': LocaleKeys.dashboard},
    3: {'icon': Icons.search, 'label': LocaleKeys.search},
    4: {'icon': Icons.favorite_border, 'label': LocaleKeys.favorite},
    5: {'icon': Icons.supervised_user_circle_sharp, 'label': LocaleKeys.user}
  };

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      selectedItemColor: Colors.deepPurpleAccent,
      items: data.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e['icon']),
              label: e['label'],
            ),
          )
          .toList(),
    );
  }
}