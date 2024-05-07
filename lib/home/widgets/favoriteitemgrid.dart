import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class favoriteitemgrid extends StatelessWidget {
  const favoriteitemgrid({super.key, required this.model, required this.index});
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(model.image))),
                margin: EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.description,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "  Price  ",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 2, 26, 7)),
                  ),
                  Text(
                    " ${model.price}\$ ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 18, 214, 60)),
                  ),
                  const Spacer(),
                  Text(
                    " ${model.rating.rate}  ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 101, 160, 114)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.cartShopping)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
