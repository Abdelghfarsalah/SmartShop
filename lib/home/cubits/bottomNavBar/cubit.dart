import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/bottomNavBar/states.dart';
import 'package:null_project/home/homescreen/Favorite.dart';
import 'package:null_project/home/homescreen/five.dart';
import 'package:null_project/home/homescreen/four.dart';
import 'package:null_project/home/homescreen/home.dart';
import 'package:null_project/home/homescreen/cart.dart';

class NavBarcubit extends Cubit<NavBarStates> {
  NavBarcubit() : super(init());
  int currentindex = 0;
  List screen = const [homepage(), Favorite(), three(), four(), five()];

  void changescreen({required int index}) {
    currentindex = index;
    emit(changenavBar());
  }
}
