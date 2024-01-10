import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  final String title;
  final String detail;
  final Icon icon;
  final void Function()? onTap;
  const SettingItemWidget(
      {Key? key,
      required this.title,
      required this.detail,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(5),
          child: icon,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(detail),
        trailing: const Icon(
          Icons.navigate_next,
          size: 30,
        ),
      ),
    );
  }
}
