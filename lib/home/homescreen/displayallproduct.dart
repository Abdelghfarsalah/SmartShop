import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:null_project/home/widgets/itemList.dart';
import 'package:null_project/home/widgets/itemgrid.dart';

class Displayallproduct extends StatefulWidget {
  const Displayallproduct({super.key});

  @override
  State<Displayallproduct> createState() => _DisplayallproductState();
}

class _DisplayallproductState extends State<Displayallproduct> {
  bool islist = true;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<Categorecubit>(context).getallproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Products",
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
        body: Column(
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
            BlocConsumer<Categorecubit, categoriesStates>(
                builder: (context, state) {
                  if (state is getproductSuccess) {
                    return islist
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: state.list.length,
                              itemBuilder: (context, index) => itemlist(
                                isfavorite: false,
                                cart: false,
                                index: index,
                                model: state.list[index],
                              ),
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) => Hero(
                                tag: index,
                                child: itemgrid(
                                  isfavorite: false,
                                  cart: false,
                                  model: state.list[index],
                                ),
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 350, crossAxisCount: 2),
                            ),
                          );
                  } else {
                    return SizedBox();
                  }
                },
                listener: (context, state) {})
          ],
        ));
  }
}
