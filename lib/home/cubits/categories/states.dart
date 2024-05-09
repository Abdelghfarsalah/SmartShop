import 'package:null_project/home/model/productmodel.dart';

abstract class categoriesStates {}

class initstate extends categoriesStates {}

class changecategore extends categoriesStates {}

class changecategorewithdata extends categoriesStates {
  final List<productmodel> res;

  changecategorewithdata({required this.res});
}

class Loading extends categoriesStates {}

class Success extends categoriesStates {
  final List<productmodel> res;

  Success({required this.res});
}

class Failuer extends categoriesStates {}

class getproductLoading extends categoriesStates {}

class getproductSuccess extends categoriesStates {
  List<productmodel> list;
  getproductSuccess({required this.list});
}

class getproductFailuer extends categoriesStates {}
