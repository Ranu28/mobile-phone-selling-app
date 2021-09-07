import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile_shop/model/phone_model.dart';

class ProductProvider extends ChangeNotifier {
  late PhoneModel _phoneModel;
  int _amount = 1;

//  getter
  PhoneModel get singleProdunt => _phoneModel;
  int get amount => _amount;
  List<PhoneModel> get getFavoitetems {
    return _phoneList.where((element) => element.isFavorite!).toList();
  }

  List<PhoneModel> _phoneList = [
    PhoneModel(
        id: 1,
        phoneSize: 8,
        imageName: "6s.png",
        color: Color(0xFFD3A984),
        color1: Color(0xFF3D82AE),
        color2: Colors.blueGrey,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Apple Iphone 6S",
        price: 120000.00),
    PhoneModel(
        id: 2,
        phoneSize: 8,
        imageName: "Nokia.png",
        color: Color(0xFFD3A984),
        color1: Color(0xFF3D82AE),
        color2: Colors.blueGrey,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Nokia Mobile",
        price: 130000.00),
    PhoneModel(
        id: 3,
        phoneSize: 12,
        imageName: "apple-iphone-x-new-1.png",
        // color: Color(0xFF3D),
        color: Colors.blueGrey,
        color1: Color(0xFF3D82AE),
        color2: Colors.blueGrey,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Apple Iphone X new",
        price: 160000.00),
    PhoneModel(
        id: 4,
        phoneSize: 10,
        imageName: "nova.png",
        color: Color(0xFF3D82AE),
        color1: Color(0xFF3D82AE),
        color2: Colors.blueGrey,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Huwawei Nova 3I",
        price: 70000.00),
    PhoneModel(
        id: 5,
        phoneSize: 6,
        imageName: "samsung-m31.png",
        color: Color(0xFF3D82AE),
        color1: Color(0xFF3D82AE),
        color2: Colors.blueGrey,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Samsung M31",
        price: 60000.00),
  ];

  List<PhoneModel> get getPhoneMdel => _phoneList;

  // PhoneModel setPhoneModel(int index) {
  //   return _phoneList[index];
  // }

  // void setIsFav(int index) {
  //   _phoneList[index].isFavorite = !_phoneList[index].isFavorite;

  //   notifyListeners();
  // }
  //
  //
  void setIsFav(int productId) {
    int temp = _phoneList.indexWhere((element) => element.id == productId);
    _phoneList[temp].isFavorite = !_phoneList[temp].isFavorite!;
    notifyListeners();
    // Logger().i(_phoneList[index].isFavorite);
  }

  //set single phone model
  void setSingleProduct(PhoneModel phoneModel) {
    _phoneModel = phoneModel;
    // print(_phoneModel.toMap());
    Logger().i(_phoneModel.toMap());
    notifyListeners();
  }

  //cart counter
  void increaseAmount() {
    _amount++;
    notifyListeners();
  }

  void decreaseAmount() {
    _amount != 1 ? _amount-- : _amount = 1;

    notifyListeners();
  }
}
