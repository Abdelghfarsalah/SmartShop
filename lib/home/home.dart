import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/bottomNavBar/states.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/widgets/customNavBar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var contr = ZoomDrawerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<Categorecubit>(context)
        .getcategory(category: "electronics", index: 0);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NavBarcubit>(context);
    return Scaffold(
        extendBody: true,
        body: BlocConsumer<NavBarcubit, NavBarStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return cubit.screen[cubit.currentindex];
          },
        ),
        bottomNavigationBar: const customNavBar());
  }
}
