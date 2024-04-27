import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/homescreen/home.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/cubit.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/states.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';
import 'package:null_project/loginAndRegister/widgets/customtextfiled.dart';

class Contactdialog extends StatefulWidget {
  const Contactdialog({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  State<Contactdialog> createState() => _ContactdialogState();
}

class _ContactdialogState extends State<Contactdialog> {
  String emial = "";

  String password = "";

  bool ispssword = true;

  GlobalKey<FormState> keyform = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: keyform,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
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
                      icon: !ispssword
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<logincubit, states>(builder: (context, state) {
                    if (state is loading) {
                      return const CircularProgressIndicator();
                    } else {
                      return Custombutton(
                          onTap: () {
                            if (keyform.currentState!.validate()) {
                              BlocProvider.of<logincubit>(context)
                                  .login(email: emial, pass: password);
                            }
                          },
                          text: "Login");
                    }
                  }, listener: (context, stets) {
                    if (stets is failuer) {
                      Fluttertoast.showToast(
                          msg: "opps: an error has occurred",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (stets is success) {
                      Fluttertoast.showToast(
                          msg: "The operation was completed successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => home()));
                    }
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                      height: 100, width: 100, fit: BoxFit.fill, widget.image)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
