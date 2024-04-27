import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/loginAndRegister/register.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';
import 'package:null_project/loginAndRegister/widgets/customtextfiled.dart';
import 'package:null_project/splashScreen/view.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String emial = "";
  String password = "";
  bool ispssword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/LoginAndRegister/Login/Group 1.png"),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      Customtextfiled(
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return "This is required";
                          }
                        },
                        onChanged: (data) {
                          emial = data;
                        },
                        password: false,
                        label: const Text("Email"),
                        hint: "Enter Your Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Customtextfiled(
                        password: ispssword,
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return "This is required";
                          }
                        },
                        onChanged: (data) {
                          password = data;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            ispssword = !ispssword;
                            setState(() {});
                          },
                          icon: ispssword
                              ? const Icon(
                                  FontAwesomeIcons.eye,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  FontAwesomeIcons.eyeSlash,
                                ),
                        ),
                        label: const Text("Password"),
                        hint: "Enter Your Password",
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Custombutton(onTap: () {}, text: "Login"),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        endIndent: 5,
                        indent: 0,
                        thickness: 2,
                        height: 10,
                      ),
                    ),
                    Text("Or"),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        endIndent: 0,
                        indent: 5,
                        thickness: 2,
                        height: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                            "assets/images/LoginAndRegister/Login/face.png")),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                            "assets/images/LoginAndRegister/Login/google.png")),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                            "assets/images/LoginAndRegister/Login/insta.png")),
                    const Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => register()));
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
