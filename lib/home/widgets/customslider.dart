import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:null_project/home/widgets/Slideritem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class customslider extends StatefulWidget {
  const customslider({super.key});

  @override
  State<customslider> createState() => _customsliderState();
}

class _customsliderState extends State<customslider> {
  List<String> list = [
    "assets/images/Sliders/Choosing clothes-bro.png",
    "assets/images/Sliders/Credit card-rafiki.png",
    "assets/images/Sliders/Electric transport-bro.png",
    "assets/images/Sliders/Jewelry shop-amico.png",
    "assets/images/Sliders/Shopping bag-bro.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: [
              CarouselSlideritem(
                image: list[0],
              ),
              CarouselSlideritem(
                image: list[1],
              ),
              CarouselSlideritem(
                image: list[2],
              ),
              CarouselSlideritem(
                image: list[3],
              ),
              CarouselSlideritem(
                image: list[4],
              ),
            ],
            options: CarouselOptions(
                height: 200, onPageChanged: (index, k) {}, autoPlay: true)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
