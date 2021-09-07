import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneModel {
  int? id, phoneSize;
  String? name, description, imageName;
  Color? color, color1, color2;
  double? price;
  bool? isFavorite;

  PhoneModel(
      {this.id,
      this.phoneSize,
      this.imageName,
      this.color,
      this.color1 = Colors.transparent,
      this.color2 = Colors.transparent,
      this.description,
      this.isFavorite = false,
      this.name,
      this.price});

  Map toMap() {
    Map<String, dynamic> map = Map();
    map['id'] = id;
    map['phoneSize'] = phoneSize;
    map['name'] = name;
    map['description'] = description;
    map['imageName'] = imageName;
    map['color'] = color.toString();
    map['price'] = price;
    map['isFavorite'] = isFavorite;

    return map;
  }

  PhoneModel.fromMap(Map map) {
    id = map['id'];
    phoneSize = map['phoneSize'];
    name = map['name'];
    description = map['description'];
    imageName = map['imageName'];
    color = map['color'].toColor();
    price = map['price'];
    isFavorite = map['isFavorite'];
  }
}
