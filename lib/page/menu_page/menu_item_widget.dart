import 'package:base_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final double? isHeight;
  final void Function()? onTap;
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeight ?? 60,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // shadow color
            spreadRadius: 5, // how much the shadow should spread
            blurRadius: 3, // how blurry the shadow should be
            offset: const Offset(0, 2), // changes the position of the shadow
          ),
        ],
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
                  child: icon,
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
    );
  }
}
