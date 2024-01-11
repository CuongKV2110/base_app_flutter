import 'package:base_app/page/home_page/home_page.dart';
import 'package:base_app/page/menu_page/menu_page.dart';
import 'package:base_app/page/search_page/search_page.dart';
import 'package:base_app/page/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../constants/constants.dart';
import '../course_page/course_page.dart';

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
          CoursePage(),
          MenuPage(),
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
              icon: Icon(Ionicons.home_outline),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.search_outline),
              label: "Search",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.book_outline),
              label: "Course",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.settings_outline),
              label: "Setting",
              backgroundColor: Colors.black,
            ),
          ]),
    );
  }
}
