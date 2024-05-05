import 'package:null_project/home/model/productmodel.dart';

abstract class DetailsStates {}

class init extends DetailsStates {}

class changeccolor extends DetailsStates {}

class changeSizeds extends DetailsStates {}

class Loading extends DetailsStates {}

class Success extends DetailsStates {
  final List<productmodel> res;

  Success({required this.res});
}

class Failuer extends DetailsStates {}
