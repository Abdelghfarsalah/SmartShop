import 'package:flutter/material.dart';

class stackonboardthree extends StatelessWidget {
  const stackonboardthree({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
            "assets/images/onboard/onboard_3/Shape 3.png"),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.15,
          left: 10,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                    height: 30, "assets/images/onboard/onboard_1/Group 41.png"),
                const Text(
                  "SmartShop",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                ),
                Divider(
                  color: Colors.white,
                  endIndent: 0,
                  indent: MediaQuery.sizeOf(context).width * 0.4,
                  thickness: 1,
                  height: 10,
                ),
                const Text(
                  "Professional App for your",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const Text(
                  "eCommerce business",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
