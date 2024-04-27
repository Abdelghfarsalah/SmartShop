import 'package:flutter/material.dart';
import 'package:null_project/onboard/Screens/onboard_1.dart';
import 'package:null_project/onboard/Screens/onboard_2.dart';
import 'package:null_project/onboard/Screens/onboard_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard_home extends StatefulWidget {
  const Onboard_home({super.key});

  @override
  State<Onboard_home> createState() => _Onboard_homeState();
}

class _Onboard_homeState extends State<Onboard_home> {
  PageController pageController = PageController();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.90,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                page = index;
                setState(() {});
              },
              children: const [
                onboaed1(),
                onboard_TOW(),
                onboard_three(),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              page != pageController.initialPage
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 197, 196, 196)),
                      onPressed: () {
                        if (page == 1) {
                          page = 0;
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut);
                        } else if (page == 2) {
                          page = 1;
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut);
                        } else {}
                        setState(() {});
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ))
                  : const SizedBox(),
              const Spacer(),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const WormEffect(
                    spacing: 20,
                    radius: 10,
                    dotWidth: 16.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 4,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (page == 0) {
                      page = 1;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                    } else if (page == 1) {
                      page = 2;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                    } else {}
                    setState(() {});
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
