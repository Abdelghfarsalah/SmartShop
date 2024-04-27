import 'package:flutter/material.dart';

class stackonboardtow extends StatelessWidget {
  const stackonboardtow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
            height: MediaQuery.sizeOf(context).height * 0.24,
            fit: BoxFit.fill,
            "assets/images/onboard/onboard_2/Shape 2.png"),
        Positioned(
            child: Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset("assets/images/onboard/onboard_2/Sub shape 2.png"),
        )),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.19,
          left: 10,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                    height: 30, "assets/images/onboard/onboard_2/Group 41.png"),
                const Text(
                  "SmartShop",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.blue),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.4),
                  endIndent: MediaQuery.sizeOf(context).width * 0.25,
                  indent: 0,
                  thickness: 1,
                  height: 10,
                ),
                const Text(
                  "Professional App for your",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const Text(
                  "eCommerce business",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
