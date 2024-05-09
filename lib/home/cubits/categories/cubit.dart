import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:http/http.dart' as http;
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/states.dart';

class Categorecubit extends Cubit<categoriesStates> {
  Categorecubit() : super(initstate());

  int index = 0;
  Map<String, bool> getornot = {
    "electronics": false,
    "jewelery": false,
    "men's clothing": false,
    "women's clothing": false,
  };
  Map<String, List<productmodel>> data = {};
  List<String> categories = [
    "Electronics",
    "Gewelery",
    "Men's clothing",
    "Women's clothing",
  ];
  List<productmodel> electronics = [];
  List<productmodel> jewelery = [];
  List<productmodel> men = [];
  List<productmodel> women = [];

  void changecategors({required int i}) {
    index = i;
    emit(changecategore());
  }

  void changecategorswithdata({required String category}) {
    emit(changecategorewithdata(res: data[category]!));
  }

  Future<void> getcategory(
      {required String category, required int index}) async {
    try {
      emit(Loading());
      List<productmodel> result = [];
      Dio k = Dio();
      Response<dynamic> l =
          await k.get("https://fakestoreapi.com/products/category/$category");
      for (var element in l.data) {
        result.add(productmodel.fromjson(element));
      }
      getornot[category] = true;
      data[category] = result;
      emit(Success(res: result));
    } catch (e) {
      emit(Failuer());
    }
  }

  Future<void> getallproduct() async {
    emit(getproductLoading());
    try {
      Dio dio = Dio();
      Response<dynamic> response =
          await dio.get("https://fakestoreapi.com/products");
      List<productmodel> result = [];
      for (var element in response.data) {
        result.add(productmodel.fromjson(element));
      }
      emit(getproductSuccess(list: result));
    } catch (e) {
      emit(getproductFailuer());
    }
  }
}
