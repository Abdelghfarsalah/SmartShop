import 'package:flutter/material.dart';
import 'package:null_project/loginAndRegister/forgetpages/otpcode.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';
import 'package:null_project/loginAndRegister/widgets/customtextfiled.dart';

class enteremil extends StatelessWidget {
  const enteremil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/LoginAndRegister/forgetpass/changepass.png"),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter E-mail ID",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Customtextfiled(
                    validator: (klaksl) {
                      return "";
                    },
                    onChanged: (onChanged) {},
                    label: const Text("Email"),
                    hint: "Enter your email to change pass",
                    password: false),
                const SizedBox(
                  height: 15,
                ),
                Custombutton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const otpcode(),
                        ),
                      );
                    },
                    text: "Continue")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
