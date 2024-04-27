import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/states.dart';
import 'package:null_project/loginAndRegister/models/usermodel.dart';

class registercubit extends Cubit<states> {
  registercubit() : super(init());
  Future<void> registernew({required usermodel user}) async {
    emit(loading());
    try {
      UserCredential u = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      emit(success());
    } catch (e) {
      emit(failuer());
    }
  }
}
