import 'package:flutter/material.dart';
import 'package:null_project/home/home.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';
import 'package:null_project/loginAndRegister/widgets/customtextfiled.dart';

class changepass extends StatelessWidget {
  const changepass({super.key});

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
                    "Reset Password",
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
                    label: const Text("Password"),
                    hint: "Enter your password ",
                    password: false),
                const SizedBox(
                  height: 15,
                ),
                Customtextfiled(
                    validator: (klaksl) {
                      return "";
                    },
                    onChanged: (onChanged) {},
                    label: const Text("confirm Password"),
                    hint: "Enter your confirm Password",
                    password: false),
                const SizedBox(
                  height: 15,
                ),
                Custombutton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const home(),
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
