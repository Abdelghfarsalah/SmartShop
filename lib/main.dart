import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:null_project/firebase_options.dart';
import 'package:null_project/onboard/Screens/onboardHome.dart';
import 'package:null_project/onboard/Screens/onboard_1.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboard_home(),
    );
  }
}
