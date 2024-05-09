import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:null_project/home/homescreen/displayallcategories.dart';
import 'package:null_project/home/homescreen/displayallproduct.dart';
import 'package:null_project/home/homescreen/notification.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/customproductitem.dart';
import 'package:null_project/home/widgets/customslider.dart';
import 'package:null_project/home/widgets/darweritem.dart';
import 'package:null_project/home/widgets/selsectCategories.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<Categorecubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orangeAccent.withOpacity(0.2)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 221, 219, 219),
                child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(
                        "assets/images/icon/Screenshot 2024-05-04 192346.png")),
              ),
              SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome🤞",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 169, 169, 169)),
                  ),
                  Text(
                    "Abdelghfar salah",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 1, 1, 1)),
                  ),
                ],
              )
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Image(
            height: 28,
            image: AssetImage("assets/images/icon/menu.png"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
            icon: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.grey.withOpacity(1),
              ),
            ),
          ),
          // IconButton(
          //     onPressed: () {},
          //     icon: CircleAvatar(
          //       radius: 30,
          //       backgroundColor: Colors.white.withOpacity(0.6),
          //       child: Icon(
          //         Icons.settings,
          //         color: Colors.grey.withOpacity(1),
          //       ),
          //     ))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                  color: Color(0xffFBDF71)),
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                      "assets/images/spalsh/Screenshot 2024-04-27 181304.png"),
                ),
              ),
            ),
            Darweritem(
                logout: false,
                title: "All Product",
                icon: const Icon(
                  FontAwesomeIcons.productHunt,
                  color: Color.fromARGB(255, 255, 202, 122),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Displayallproduct()));
                }),
            Darweritem(
                logout: false,
                title: "Search",
                icon: const Icon(
                  FontAwesomeIcons.searchengin,
                  color: Color.fromARGB(255, 255, 202, 122),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 3);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 3;
                }),
            Darweritem(
                logout: false,
                title: "Your Cart",
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Color.fromARGB(255, 255, 202, 122),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 2);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 2;
                }),
            Darweritem(
                logout: false,
                title: "Favorite",
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 255, 202, 122),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 1);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 1;
                }),
            Darweritem(
                logout: false,
                title: "Setting",
                icon: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 255, 202, 122),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 4);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 4;
                }),
            Spacer(),
            Spacer(),
            Darweritem(
                title: "Log Out",
                logout: true,
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Colors.red,
                ),
                onPressed: () {}),
            Spacer(),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //const customslider(),
              // const Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Text(
              //     "   Explore The best",
              //     style: TextStyle(fontSize: 24, color: Colors.grey),
              //   ),
              // ),
              // const Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Row(
              //     children: [
              //       Text(
              //         "  products in the  ",
              //         style: TextStyle(
              //             fontStyle: FontStyle.italic,
              //             fontSize: 30,
              //             fontWeight: FontWeight.w900,
              //             color: Colors.black),
              //       ),
              //       Text(
              //         "world ",
              //         style: TextStyle(
              //             decoration: TextDecoration.underline,
              //             fontStyle: FontStyle.italic,
              //             fontSize: 32,
              //             fontWeight: FontWeight.w900,
              //             color: Colors.deepOrangeAccent),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.26,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 0),
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      decoration: BoxDecoration(

                          // gradient: const LinearGradient(
                          //     begin: Alignment.bottomLeft,
                          //     end: Alignment.topCenter,
                          //     colors: [
                          //       Color.fromARGB(255, 255, 175, 54),
                          //       // Color.fromARGB(255, 255, 255, 255),
                          //     ]),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 6,
                                offset: Offset(10, 10),
                                color: Colors.grey),
                            // BoxShadow(
                            //     blurRadius: 6,
                            //     offset: Offset(-10, -10),
                            //     color: Color.fromARGB(255, 209, 208, 208))
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 211, 211, 211),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 169, 78)),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          //const customslider(),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "   Explore The best",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 152, 152, 152)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
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
                        left: MediaQuery.sizeOf(context).width * 0.57,
                        top: -70,
                        child: Image.asset(
                            height: MediaQuery.sizeOf(context).width * 0.5,
                            "assets/images/icon/409615d863ca502e9ef0a9946bf9c5dd-removebg-preview.png"))
                  ],
                ),
              ),

              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        onTap: () {
                          BlocProvider.of<NavBarcubit>(context).currentindex =
                              3;
                          BlocProvider.of<NavBarcubit>(context)
                              .changescreen(index: 3);
                        },
                        //style: TextStyle(height: 30),
                        decoration: const InputDecoration(
                          hintText: "Enter the Name of product ",
                          contentPadding: EdgeInsets.only(
                              left: 10, top: 0, bottom: 0, right: 0),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 245, 207),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 197, 161, 17)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<NavBarcubit>(context).currentindex =
                                3;
                            BlocProvider.of<NavBarcubit>(context)
                                .changescreen(index: 3);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
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
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
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
                  } else if (state is changecategorewithdata) {
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
        ),
      ),
    );
  }
}
