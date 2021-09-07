import 'package:flutter/material.dart';
import 'package:mobile_shop/model/phone_model.dart';

class CartItemModel {
  int id;
  int amount;
  PhoneModel phonrModel;

  CartItemModel({
    required this.id,
    required this.amount,
    required this.phonrModel,
  });

  // Map toMap() {
  //   Map<String, dynamic> map = Map();
  //   map['id'] = id;
  //   map['id'] = id;
  //   map['id'] = id;

  // }
}
