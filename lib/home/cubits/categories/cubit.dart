import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:http/http.dart' as http;
import 'package:null_project/home/model/productmodel.dart';

class Categorecubit extends Cubit<categoriesStates> {
  Categorecubit() : super(init());
  int index = 0;
  // List<bool> getornot = [
  //   false,
  //   false,
  //   false,
  //   false,
  // ];
  List<String> categories = [
    "Electronics",
    "Gewelery",
    "Men's clothing",
    "Women's clothing",
  ];
  // List<productmodel> Electronics = [];
  // List<productmodel> Gewelery = [];
  // List<productmodel> men = [];
  // List<productmodel> women = [];
  // late List<List<productmodel>> datafromapi = [
  //   Electronics,
  //   Gewelery,
  //   men,
  //   women
  //];
  void changecategors({required int i}) {
    index = i;
    emit(changecategore());
  }

  Future<void> getcategory(
      {required String category, required int index}) async {
    emit(Loading());
    try {
      List<productmodel> result = [];
      Dio k = Dio();
      Response<dynamic> l =
          await k.get("https://fakestoreapi.com/products/category/$category");
      for (var element in l.data) {
        result.add(productmodel.fromjson(element));
      }
      emit(Success(res: result));
    } catch (e) {
      emit(Failuer());
    }
  }
}
