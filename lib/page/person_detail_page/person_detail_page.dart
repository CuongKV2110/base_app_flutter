import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../constants/constants.dart';

class PersonDetailPage extends StatefulWidget {
  const PersonDetailPage({Key? key}) : super(key: key);

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackground,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _infoDetail(),
              hSpaceItem3,
              _gridDetail(),
              hSpaceItem3,
              _optionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _infoDetail() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.blue,
    );
  }

  _gridDetail() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _gridItemWidget(),
              wSpaceItem1,
              _gridItemWidget(),
            ],
          ),
          hSpaceItem1,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _gridItemWidget(),
              wSpaceItem1,
              _gridItemWidget(),
            ],
          ),
        ],
      ),
    );
  }

  _optionWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _personOptionItem('Courses Manager'),
          hSpaceItem1,
          _personOptionItem('Courses Edit'),
        ],
      ),
    );
  }

  _gridItemWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
      ),
    );
  }

  _personOptionItem(String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(Ionicons.ice_cream),
                  ),
                  wSpaceItem1,
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.navigate_next,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
