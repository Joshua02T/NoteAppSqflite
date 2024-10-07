import 'package:flutter/material.dart';
import 'package:homework_list/constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String labeltext;
  final FormFieldValidator<String>? myvalidator;
  const CustomTextField(
      {super.key,
      required this.mycontroller,
      required this.labeltext,
      this.myvalidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: myvalidator,
        decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(color: MyColors.black),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20))),
        controller: mycontroller);
  }
}
