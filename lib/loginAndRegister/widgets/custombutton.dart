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
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                spreadRadius: 1,
                color: Color.fromARGB(255, 171, 211, 243),
                offset: Offset(1, 5),
                blurRadius: 1)
          ],
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 241, 241, 241)]),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
