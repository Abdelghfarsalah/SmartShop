import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managenotificationCubit/Statenoti.dart';
import 'package:null_project/home/widgets/archevment.dart';
import 'package:null_project/home/widgets/earlier.dart';
import 'package:null_project/home/widgets/recentnoti.dart';

class managenotificationCubit extends Cubit<Statenoti> {
  managenotificationCubit() : super(init());
  List<Widget> screen = const [recent(), earlier(), archevment()];
  int currentindex = 0;
  void changescreen({required int index}) {
    currentindex = index;
    emit(change());
  }
}
