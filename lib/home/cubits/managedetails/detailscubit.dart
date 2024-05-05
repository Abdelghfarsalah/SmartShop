import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managedetails/detailsStates.dart';

class detailscubit extends Cubit<DetailsStates> {
  detailscubit() : super(init());
  int colorindex = 0;
  int sizeindex = 0;
  List<Color> colors = const [
    Color(0xff691406),
    Color(0xffC23032),
    Color(0xffFF994E),
    Color(0xffF9BE00),
    Color(0xffFFE299),
    Color(0xff4CB149),
  ];
  List<String> Sizes = [
    "14.2",
    "15.8",
    "16.0",
    "16.5",
    "18.5",
  ];
  void changecolor({required int i}) {
    colorindex = i;
    emit(changeccolor());
  }

  void changesize({required int i}) {
    sizeindex = i;
    emit(changeSizeds());
  }
}
