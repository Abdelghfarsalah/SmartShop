import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';

class customNavBar extends StatefulWidget {
  const customNavBar({super.key});

  @override
  State<customNavBar> createState() => _customNavBarState();
}

class _customNavBarState extends State<customNavBar> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NavBarcubit>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff17203A).withOpacity(0.3),
                offset: const Offset(0, 1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NavBarcubit>(context)
                        .changescreen(index: 0);
                    setState(() {});
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                          height: 4,
                          width: cubit.currentindex == 0 ? 30 : 0,
                          color: Colors.blue,
                          duration: const Duration(milliseconds: 500)),
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(
                        FontAwesomeIcons.house,
                        size: cubit.currentindex == 0 ? 25 : 20,
                        color: cubit.currentindex == 0
                            ? Colors.black
                            : Color.fromARGB(255, 104, 104, 104),
                      ),
                    ],
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NavBarcubit>(context)
                        .changescreen(index: 1);
                    setState(() {});
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                          height: 4,
                          width: cubit.currentindex == 1 ? 30 : 0,
                          color: Colors.blue,
                          duration: const Duration(milliseconds: 500)),
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(Icons.add_a_photo_sharp,
                          size: cubit.currentindex == 1 ? 25 : 20,
                          color: cubit.currentindex == 1
                              ? Colors.black
                              : Color.fromARGB(255, 104, 104, 104)),
                    ],
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NavBarcubit>(context)
                        .changescreen(index: 2);
                    setState(() {});
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                          height: 4,
                          width: cubit.currentindex == 2 ? 30 : 0,
                          color: Colors.blue,
                          duration: const Duration(milliseconds: 500)),
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(
                        Icons.add_a_photo_sharp,
                        size: cubit.currentindex == 2 ? 25 : 20,
                        color: cubit.currentindex == 2
                            ? Colors.black
                            : Color.fromARGB(255, 104, 104, 104),
                      ),
                    ],
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NavBarcubit>(context)
                        .changescreen(index: 3);
                    setState(() {});
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                          height: 4,
                          width: cubit.currentindex == 3 ? 30 : 0,
                          color: Colors.blue,
                          duration: const Duration(milliseconds: 500)),
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(
                        Icons.add_a_photo_sharp,
                        size: cubit.currentindex == 3 ? 25 : 20,
                        color: cubit.currentindex == 3
                            ? Colors.black
                            : Color.fromARGB(255, 104, 104, 104),
                      ),
                    ],
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NavBarcubit>(context)
                        .changescreen(index: 4);
                    setState(() {});
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                          height: 4,
                          width: cubit.currentindex == 4 ? 30 : 0,
                          color: Colors.blue,
                          duration: const Duration(milliseconds: 500)),
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(
                        FontAwesomeIcons.user,
                        size: cubit.currentindex == 4 ? 25 : 20,
                        color: cubit.currentindex == 4
                            ? Colors.black
                            : Color.fromARGB(255, 104, 104, 104),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
