import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneModel {
  int id, phoneSize;
  String name, description, imageName;
  Color color, color1, color2;
  double price;
  bool isFavorite;

  PhoneModel(
      {required this.id,
      required this.phoneSize,
      required this.imageName,
      required this.color,
      this.color1 = Colors.transparent,
      this.color2 = Colors.transparent,
      required this.description,
      this.isFavorite = false,
      required this.name,
      required this.price});
}
