import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardstates.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/itemList.dart';
import 'package:null_project/home/widgets/itemgrid.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool islist = true;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageLove_Cart_states_cubit>(context);

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
        body:
            BlocConsumer<ManageLove_Cart_states_cubit, magnageLoveAndCartState>(
          builder: (context, state) {
            return cubit.LoveItem.length == 0
                ? Center(
                    child: Lottie.asset("assets/animaitons/cartempty.json"))
                : islist
                    ? ListView.builder(
                        itemCount: cubit.LoveItem.length,
                        itemBuilder: (context, index) => Hero(
                          tag: index,
                          child: itemlist(
                            isfavorite: false,
                            cart: false,
                            index: index,
                            model: cubit.LoveItem[index],
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: cubit.LoveItem.length,
                        itemBuilder: (context, index) => Hero(
                          tag: index,
                          child: itemgrid(
                            isfavorite: false,
                            cart: false,
                            model: cubit.LoveItem[index],
                          ),
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 350, crossAxisCount: 2),
                      );
          },
          listener: (context, state) {},
        ));
  }
}
