import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managedetails/detailscubit.dart';

class Selectcoloritem extends StatelessWidget {
  const Selectcoloritem({super.key, required this.isactive, required this.i});
  final bool isactive;
  final int i;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<detailscubit>(context);
    return GestureDetector(
      onTap: () {
        cubit.changecolor(i: i);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CircleAvatar(
          radius: isactive ? 25 : 18,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: isactive ? 22 : 18,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: BlocProvider.of<detailscubit>(context).colors[i],
            ),
          ),
        ),
      ),
    );
  }
}
