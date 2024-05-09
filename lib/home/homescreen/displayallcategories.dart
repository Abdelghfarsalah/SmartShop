import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/customproductitem.dart';
import 'package:null_project/home/widgets/selsectCategories.dart';

class Displayallcategories extends StatefulWidget {
  const Displayallcategories({super.key, required this.word});
  final String word;

  @override
  State<Displayallcategories> createState() => _DisplayallcategoriesState();
}

class _DisplayallcategoriesState extends State<Displayallcategories> {
  bool islist = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<Categorecubit>(context)
        .getcategory(category: widget.word, index: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<Categorecubit>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       islist = !islist;
          //       setState(() {});
          //     },
          //     child: AnimatedContainer(
          //       duration: Duration(milliseconds: 750),
          //       child: Icon(
          //         Icons.list,
          //         size: islist ? 35 : 30,
          //         color: islist ? Colors.orangeAccent : Colors.grey,
          //       ),
          //     ),
          //   ),
          //   const SizedBox(
          //     width: 10,
          //   ),
          //   GestureDetector(
          //     onTap: () {
          //       islist = !islist;
          //       setState(() {});
          //     },
          //     child: AnimatedContainer(
          //       duration: Duration(milliseconds: 750),
          //       child: Icon(
          //         FontAwesomeIcons.grip,
          //         size: !islist ? 30 : 25,
          //         color: !islist ? Colors.orangeAccent : Colors.grey,
          //       ),
          //     ),
          //   ),
          //   const SizedBox(
          //     width: 10,
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.28,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 20),
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 250, 167, 59)),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            //const customslider(),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "   Explore The best",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.grey),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "  products in the  ",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "world ",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.deepOrangeAccent),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: MediaQuery.sizeOf(context).width * 0.5,
                          top: -50,
                          child: Image.asset(
                              height: MediaQuery.sizeOf(context).width * 0.5,
                              "assets/images/icon/409615d863ca502e9ef0a9946bf9c5dd-removebg-preview.png"))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: selsectCategories(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: BlocBuilder<Categorecubit, categoriesStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            "   ${cubit.categories[cubit.index]}...",
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                color: Color(0xffDF6700),
                                fontWeight: FontWeight.w900),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Displayallcategories(
                                    word: cubit.categories[cubit.index],
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Show All",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 243, 170, 106),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 15,
                            color: Color.fromARGB(255, 243, 170, 106),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              BlocConsumer<Categorecubit, categoriesStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is Success) {
                    List<productmodel> pro = state.res;
                    List<customproductitem> item = [];
                    for (var element in pro) {
                      item.add(customproductitem(
                          cart: false, isfavorite: false, model: element));
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: ListWheelScrollView(
                          itemExtent: MediaQuery.sizeOf(context).height * 0.3,
                          children: item,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: const Center(
                            child: LinearProgressIndicator(
                          color: Colors.orangeAccent,
                        )));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
