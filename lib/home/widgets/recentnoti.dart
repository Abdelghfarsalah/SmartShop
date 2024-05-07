import 'package:flutter/material.dart';
import 'package:null_project/home/widgets/customnotification.dart';

class recent extends StatelessWidget {
  const recent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: true),
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: false),
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: true),
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: false),
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: true),
        customnotification(
            image: "assets/images/icon/Screenshot 2024-05-04 192346.png",
            new1: true),
      ],
    );
  }
}
