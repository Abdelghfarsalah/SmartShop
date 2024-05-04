import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/bottomNavBar/states.dart';
import 'package:null_project/home/homescreen/categore.dart';
import 'package:null_project/home/homescreen/five.dart';
import 'package:null_project/home/homescreen/four.dart';
import 'package:null_project/home/homescreen/home.dart';
import 'package:null_project/home/homescreen/three.dart';

class NavBarcubit extends Cubit<NavBarStates> {
  NavBarcubit() : super(init());
  int currentindex = 0;
  List screen = const [homepage(), second(), three(), four(), five()];

  void changescreen({required int index}) {
    currentindex = index;
    emit(changenavBar());
  }
}
