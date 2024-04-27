import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/firebase_options.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/cubit.dart';
import 'package:null_project/loginAndRegister/cubits/registercubit/cubit.dart';
import 'package:null_project/onboard/Screens/onboardHome.dart';
import 'package:null_project/onboard/Screens/onboard_1.dart';
import 'package:null_project/splashScreen/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splash(),
      ),
    );
  }
}
