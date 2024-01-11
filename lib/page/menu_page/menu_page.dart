import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../widget/appbar_widget.dart';
import '../create_course_page/create_course_page.dart';
import '../my_course/my_course_page.dart';
import '../setting_page/setting_item_widget.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SettingItemWidget(
                title: "My Profile",
                detail: "Deleted",
                icon: Icon(Icons.delete),
              ),
              hSpaceItem1,
              SettingItemWidget(
                title: "My Courses",
                detail: "Deleted",
                icon: Icon(Icons.delete),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MyCoursePage();
                    }),
                  );
                },
              ),
              hSpaceItem1,
              SettingItemWidget(
                title: "Create course",
                detail: "Deleted",
                icon: Icon(Icons.delete),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CreateCoursePage();
                    }),
                  );
                },
              ),
              hSpaceItem1,
              SettingItemWidget(
                title: "Bin",
                detail: "Deleted",
                icon: Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
