import 'package:null_project/home/model/productmodel.dart';

abstract class categoriesStates {}

class init extends categoriesStates {}

class changecategore extends categoriesStates {}

class Loading extends categoriesStates {}

class Success extends categoriesStates {
  final List<productmodel> res;

  Success({required this.res});
}

class Failuer extends categoriesStates {}
