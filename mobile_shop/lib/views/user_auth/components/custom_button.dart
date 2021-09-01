import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.name,
    required this.onTapFunction,
  }) : super(key: key);

  final Size size;
  final String name;
  final Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height / 16,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight,
            fontSize: size.height / 30,
          ),
        ),
      ),
    );
  }
}
