import 'package:flutter/material.dart';
import 'package:null_project/onboard/widgets/StackinOboardone.dart';
import 'package:null_project/onboard/widgets/StackinOboardtow.dart';

class onboard_TOW extends StatelessWidget {
  const onboard_TOW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const stackonboardtow(),
          Spacer(
            flex: 4,
          ),
          Image.asset(
              height: MediaQuery.sizeOf(context).height * 0.35,
              'assets/images/onboard/onboard_2/Group.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Track order !!",
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
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
