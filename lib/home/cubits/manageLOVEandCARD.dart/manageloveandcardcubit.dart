import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardstates.dart';
import 'package:null_project/home/model/productmodel.dart';

class ManageLove_Cart_states_cubit extends Cubit<magnageLoveAndCartState> {
  ManageLove_Cart_states_cubit() : super(init());
  List<productmodel> cartItem = [];
  List<productmodel> LoveItem = [];

  void addtocart({required productmodel item}) {
    print("cZXC");
    cartItem.add(item);
    print("cZsdaXC");
    emit(additemtocart());
  }

  void addtolove({required productmodel item}) {
    LoveItem.add(item);
    emit(additemtoLove());
  }

  void removefromcart({required productmodel item}) {
    cartItem.remove(item);
    emit(removeitemfromcart());
  }

  void removefromLove({required productmodel item}) {
    LoveItem.remove(item);
    emit(removeitemfromLove());
  }
}
