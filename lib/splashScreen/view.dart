import 'package:flutter/material.dart';
import 'package:null_project/onboard/Screens/onboardHome.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoboard();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
            "assets/images/spalsh/Screenshot 2024-04-27 181304.png"),
      ),
    );
  }

  Future<void> gotoboard() async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Onboard_home()),
          (h) => false);
    });
  }
}
