import 'package:flutter/material.dart';

class customnotification extends StatelessWidget {
  const customnotification(
      {super.key, required this.image, required this.new1});
  final String image;
  final bool new1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: new1 ? Colors.orange.withOpacity(0.2) : Colors.transparent),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Super Offer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Get 60% off in our first booking",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Text(
            "Sun,12:40pm",
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
