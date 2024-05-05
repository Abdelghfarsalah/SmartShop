import 'package:flutter/material.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/SelectColor.dart';
import 'package:null_project/home/widgets/Selectcoloritem.dart';
import 'package:null_project/home/widgets/selectSize.dart';

class Detailsbody extends StatelessWidget {
  const Detailsbody({super.key, required this.model});
  final productmodel model;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: Hero(
              tag: model.id,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(model.image),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white),
              maxLines: 1,
            ),
          ),
          const Text(
            "[Made in Egypt]",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey),
            maxLines: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Price : ${model.price}\$",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.green),
                ),
                const Spacer(),
                Text(
                  "Rating : ${model.rating.rate}  ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.yellow),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 15,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: SelectColor()),
                Expanded(flex: 1, child: selectSize()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
