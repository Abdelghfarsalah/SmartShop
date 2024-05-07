import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/favoriteitemList.dart';
import 'package:null_project/home/widgets/favoriteitemgrid.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  bool islist = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Favorite",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                islist = !islist;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 750),
                child: Icon(
                  Icons.list,
                  size: islist ? 35 : 30,
                  color: islist ? Colors.orangeAccent : Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                islist = !islist;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 750),
                child: Icon(
                  FontAwesomeIcons.grip,
                  size: !islist ? 30 : 25,
                  color: !islist ? Colors.orangeAccent : Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: islist
            ? ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Hero(
                  tag: index,
                  child: favoriteitemlist(
                    index: index,
                    model: productmodel(
                      id: 1,
                      title:
                          "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                      price: "78",
                      description:
                          "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                      category: "category",
                      image:
                          "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                      rating: Rating(rate: 5, count: 5),
                    ),
                  ),
                ),
              )
            : GridView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Hero(
                  tag: index,
                  child: favoriteitemgrid(
                    index: index,
                    model: productmodel(
                      id: 1,
                      title:
                          "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                      price: "78",
                      description:
                          "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                      category: "category",
                      image:
                          "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                      rating: Rating(rate: 5, count: 5),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 350, crossAxisCount: 2),
              ));
  }
}
/*
 ListView(
          physics: BouncingScrollPhysics(),
          children: [
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
            favoriteitemlist(
              model: productmodel(
                id: 1,
                title:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                price: "78",
                description:
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                category: "category",
                image:
                    "https://t3.ftcdn.net/jpg/02/10/85/26/360_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg",
                rating: Rating(rate: 5, count: 5),
              ),
            ),
          ],
        )
 */