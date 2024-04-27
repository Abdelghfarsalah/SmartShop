import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 148, 147, 164),
            Color.fromARGB(255, 83, 118, 156),
            Color.fromARGB(255, 62, 119, 165),
            Color.fromARGB(255, 25, 111, 182),
            Color.fromARGB(255, 0, 99, 180),
            Color.fromARGB(255, 25, 111, 182),
            Color.fromARGB(255, 62, 119, 165),
            Color.fromARGB(255, 83, 118, 156),
            Color.fromARGB(255, 148, 147, 164),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
