import 'package:base_app/page/menu_page/log_out_widget.dart';
import 'package:base_app/page/menu_page/profile_widget.dart';
import 'package:base_app/page/person_detail_page/person_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/constants.dart';
import '../../widget/appbar_widget.dart';
import 'menu_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrayd2,
        appBar: AppBarWidget(
          title: "MENU PAGE",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidget(
                  title: 'KieuVanCuong',
                  icon: Icon(Ionicons.person_outline),
                ),
                hSpaceItem2,
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Personals Detail",
                  icon: Icon(Ionicons.person_outline),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return PersonDetailPage();
                      }),
                    );
                  },
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Login and Security",
                  icon: Icon(Ionicons.shield_outline),
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Notifications",
                  icon: Icon(Ionicons.notifications_outline),
                ),
                hSpaceItem3,
                Text(
                  "Legal Policy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Term of Service",
                  icon: Icon(Ionicons.reader_outline),
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Privacy & Security",
                  icon: Icon(Ionicons.lock_open_outline),
                ),
                hSpaceItem1,
                MenuItemWidget(
                  title: "Cookies Standards",
                  icon: Icon(Ionicons.swap_horizontal_outline),
                ),
                hSpaceItem2,
                LogOutWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
