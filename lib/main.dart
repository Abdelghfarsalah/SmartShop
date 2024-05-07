import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/firebase_options.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/managedetails/detailscubit.dart';
import 'package:null_project/home/cubits/managenotificationCubit/managenotificationCubit.dart';
import 'package:null_project/home/home.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/cubit.dart';
import 'package:null_project/loginAndRegister/cubits/registercubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent));
  runApp(const SmartpuyApp());
}

class SmartpuyApp extends StatelessWidget {
  const SmartpuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => registercubit()),
        BlocProvider(create: (context) => logincubit()),
        BlocProvider(create: (context) => NavBarcubit()),
        BlocProvider(create: (context) => Categorecubit()),
        BlocProvider(create: (context) => managenotificationCubit()),
        BlocProvider(create: (context) => detailscubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
      ),
    );
  }
}
