import 'package:flutter/material.dart';
import 'package:null_project/onboard/Screens/onboard_2.dart';
import 'package:null_project/onboard/Screens/onboard_3.dart';
import 'package:null_project/onboard/widgets/StackinOboardone.dart';

class onboaed1 extends StatelessWidget {
  const onboaed1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const stackonboardone(),
        Image.asset(
            height: MediaQuery.sizeOf(context).height * 0.35,
            'assets/images/onboard/onboard_1/Purchase online.png'),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Purchase Online !!",
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
    );
  }
}
