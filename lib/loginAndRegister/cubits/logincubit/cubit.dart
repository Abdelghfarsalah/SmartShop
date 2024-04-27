import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/states.dart';
import 'package:null_project/loginAndRegister/models/usermodel.dart';

class logincubit extends Cubit<states> {
  logincubit() : super(init());
  Future<void> login({required String email, required String pass}) async {
    emit(loading());
    try {
      UserCredential u = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      emit(success());
    } catch (e) {
      emit(failuer());
    }
  }
}
