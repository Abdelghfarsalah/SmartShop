import 'package:flutter/material.dart';

class Darweritem extends StatelessWidget {
  const Darweritem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      required this.logout});
  final String title;
  final Widget icon;
  final bool logout;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: !logout ? Colors.black : Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        trailing: icon,
      ),
    );
  }
}
