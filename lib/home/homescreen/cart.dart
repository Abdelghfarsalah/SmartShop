import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardstates.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/itemList.dart';
import 'package:null_project/home/widgets/itemgrid.dart';

class three extends StatefulWidget {
  const three({super.key});

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  bool islist = true;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageLove_Cart_states_cubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
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
                            "   Add more",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 24,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                "  products To your",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                              Text(
                                " Cart",
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
          BlocConsumer<ManageLove_Cart_states_cubit, magnageLoveAndCartState>(
            builder: (context, state) {
              return cubit.cartItem.length == 0
                  ? Center(
                      child: Lottie.asset("assets/animaitons/cartempty.json"))
                  : islist
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: cubit.cartItem.length,
                            itemBuilder: (context, index) => itemlist(
                              isfavorite: false,
                              cart: false,
                              index: index,
                              model: cubit.cartItem[index],
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: cubit.cartItem.length,
                            itemBuilder: (context, index) => Hero(
                              tag: index,
                              child: itemgrid(
                                isfavorite: false,
                                cart: false,
                                model: cubit.cartItem[index],
                              ),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 350, crossAxisCount: 2),
                          ),
                        );
            },
            listener: (context, state) {},
          )
        ],
      ),
    );
  }
}
