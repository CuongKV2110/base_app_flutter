import 'package:base_app/constants/constants.dart';
import 'package:base_app/page/setting_page/setting_item_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar_widget.dart';
import '../create_course_page/create_course_page.dart';
import '../my_course/my_course_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "Setting Page",
        ),
        backgroundColor: colorGrayd2,
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
