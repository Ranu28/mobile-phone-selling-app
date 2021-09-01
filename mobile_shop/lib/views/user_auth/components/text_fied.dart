import 'package:flutter/material.dart';

class CustomInputTextFiel extends StatelessWidget {
  final String fieldName;
  final TextInputType fieldInputType;
  final Function(String) onchange;
  final TextEditingController controller;
  final String? errorTxt;
  final int maxlines;
  final bool isObsecure;
  // ignore: non_constant_identifier_names
  const CustomInputTextFiel(
      {Key? key,
      required this.fieldName,
      required this.fieldInputType,
      required this.onchange,
      required this.errorTxt,
      required this.controller,
      this.maxlines = 1,
      this.isObsecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      maxLines: maxlines,
      controller: controller,
      onChanged: onchange,
      keyboardType: fieldInputType,
      decoration: InputDecoration(
        errorText: errorTxt,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: errorTxt != null ? Colors.red : Colors.grey)),
        labelText: fieldName,
        labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
