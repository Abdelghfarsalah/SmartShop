import 'package:flutter/material.dart';
import 'package:null_project/onboard/widgets/StackinOboardone.dart';
import 'package:null_project/onboard/widgets/StackinOboardthree.dart';
import 'package:null_project/onboard/widgets/StackinOboardtow.dart';

class onboard_three extends StatelessWidget {
  const onboard_three({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const stackonboardthree(),
          Image.asset(
              height: MediaQuery.sizeOf(context).height * 0.35,
              'assets/images/onboard/onboard_3/Group.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Get your order !!",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing,",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black),
          ),
          const Text(
            "sed do eiusmod tempor ut labore",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
