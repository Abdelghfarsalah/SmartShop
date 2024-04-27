import 'package:flutter/material.dart';

class Customtextfiled extends StatelessWidget {
  const Customtextfiled(
      {super.key,
      required this.validator,
      required this.onChanged,
      required this.label,
      required this.hint,
      this.suffixIcon,
      required this.password});
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget label;
  final String hint;
  final Widget? suffixIcon;
  final bool password;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      obscuringCharacter: "*",
      obscureText: password,
      decoration: InputDecoration(
          label: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey)),
          hintText: hint,
          suffixIcon: suffixIcon),
    );
  }
}
