import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:null_project/home/homescreen/detailsscreen/buypage.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/splashScreen/view.dart';

class custombuttonforbuy extends StatelessWidget {
  const custombuttonforbuy({super.key, required this.model});
  final productmodel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => buybage(model: model),
            ),
          );
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(0.2)),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Text(
                  "   ${model.price}\$",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                Container(
                  height: 70,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffFCC873)),
                  child: const Center(
                    child: Text(
                      "Buy Online",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
