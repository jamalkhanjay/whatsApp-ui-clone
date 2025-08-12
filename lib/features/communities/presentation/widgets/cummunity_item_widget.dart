import 'package:flutter/material.dart';

Widget buildCommunityItem({
  IconData? icon,
  Widget? iconWidget,
  Color bgColor = Colors.transparent,
  required String title,
  required String subtitle,
  required String trailingText,
  bool showGreenDot = false,
}) {
  return ListTile(
    leading: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: iconWidget ?? Icon(icon, color: Colors.green, size: 26),
    ),
    title: Text(title),
    subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          trailingText,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        if (showGreenDot)
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Icon(Icons.circle, color: Colors.green, size: 10),
          ),
      ],
    ),
    onTap: () {},
  );
}
