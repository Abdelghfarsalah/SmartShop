import 'package:flutter/material.dart';
import 'package:null_project/loginAndRegister/forgetpages/changepass.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';
import 'package:null_project/loginAndRegister/widgets/customtextfiled.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class otpcode extends StatelessWidget {
  const otpcode({super.key});

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
                    "assets/images/LoginAndRegister/forgetpass/otp.png"),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please confirm the security code received on yur registered email",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Colors.blue,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Custombutton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const changepass(),
                        ),
                      );
                    },
                    text: "Confirm"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Did not receive the code?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Send again",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
