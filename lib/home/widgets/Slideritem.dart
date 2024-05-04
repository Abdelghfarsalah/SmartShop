import 'package:flutter/material.dart';

class CarouselSlideritem extends StatelessWidget {
  const CarouselSlideritem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 254, 254),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 10),
                  blurRadius: 2,
                  spreadRadius: 0.2)
            ]),
      ),
    );
  }
}
