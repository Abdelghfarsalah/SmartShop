import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:http/http.dart' as http;
import 'package:null_project/home/model/productmodel.dart';

class Categorecubit extends Cubit<categoriesStates> {
  Categorecubit() : super(init());
  int index = 0;
  void changecategors({required int i}) {
    index = i;
    emit(changecategore());
  }

  Future<void> getcategory({required String category}) async {
    emit(Loading());
    print("object");
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
