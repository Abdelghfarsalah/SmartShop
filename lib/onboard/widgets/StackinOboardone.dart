import 'package:flutter/material.dart';

class stackonboardone extends StatelessWidget {
  const stackonboardone({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/onboard/onboard_1/Shape 1.png"),
        Positioned(
            child: Align(
          alignment: Alignment.bottomRight,
          child: Image.asset("assets/images/onboard/onboard_1/Sub shape 1.png"),
        )),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.12,
          left: 10,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
