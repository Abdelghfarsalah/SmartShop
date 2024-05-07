import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class favoriteitemlist extends StatelessWidget {
  const favoriteitemlist({super.key, required this.model, required this.index});
  final productmodel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(model: model),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Container(
          height: 150,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 1, offset: Offset(0, 10))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFCC873),
                  Colors.white,
                ]),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(model.image)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      model.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "${model.price}\$ ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.cartShopping)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
          ),
        ),
      ),
    );
  }
}
