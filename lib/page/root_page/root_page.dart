import 'package:base_app/page/home_page/home_page.dart';
import 'package:base_app/page/menu_page/menu_page.dart';
import 'package:base_app/page/search_page/search_page.dart';
import 'package:base_app/page/setting_page/setting_page.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  final PageController _pageController =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrayd2,
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          SearchPage(),
          MenuPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              _pageController.jumpToPage(selectedIndex);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Menu",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Setting",
              backgroundColor: Colors.black,
            ),
          ]),
    );
  }
}
