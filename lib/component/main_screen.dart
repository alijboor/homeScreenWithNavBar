import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/views/category_product/screens/category_screen.dart';
import 'package:home_screen/views/home/screens/homeScreen.dart';
import 'package:home_screen/views/search/search_screen.dart';
import 'package:home_screen/views/userProfile/user_profile_screen.dart';
import 'package:home_screen/views/wishList/wish_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.body, this.appBar, this.selectedIndex});

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final int? selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    if (widget.selectedIndex != null) currentIndex = widget.selectedIndex!;
    super.initState();
  }

  final Map<int, dynamic> data = {
    1: {'icon': Icons.store_outlined, 'label': LocaleKeys.home},
    2: {'icon': Icons.dashboard_outlined, 'label': LocaleKeys.category},
    3: {'icon': Icons.search, 'label': LocaleKeys.search},
    4: {'icon': Icons.favorite_border, 'label': LocaleKeys.favorite},
    5: {'icon': Icons.supervised_user_circle_sharp, 'label': LocaleKeys.user}
  };

  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    SearchScreen(),
    WishListScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body ?? pages[currentIndex],
      appBar: widget.appBar,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          currentIndex = index;
          setState(() {});
        },
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
      ),
    );
  }
}