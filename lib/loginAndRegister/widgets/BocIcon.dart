import 'package:flutter/material.dart';

class boxIcon extends StatelessWidget {
  const boxIcon({super.key, required this.icon, required this.onTap});
  final Image icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
