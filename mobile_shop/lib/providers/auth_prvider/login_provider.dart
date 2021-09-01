import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/controller/auth_controller.dart';
import 'package:mobile_shop/utils/dialog_boxes.dart';

class LoginProvider extends ChangeNotifier {
  final _usernameOEmail = TextEditingController();
  final _password = TextEditingController();

  bool _isLoading = false;

  //getters
  bool get getIsLoading => _isLoading;
  TextEditingController get getusernameOEmail => _usernameOEmail;
  TextEditingController get getPassword => _password;

  //setters
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    // Logger().i(_isLoading);
    notifyListeners();
  }

  Future<void> startLogin(BuildContext context) async {
    if (_usernameOEmail.text.isNotEmpty || _password.text.isNotEmpty) {
      setIsLoading(true);
      await AuthController(context)
          .loginUser(_usernameOEmail.text, _password.text);
      setIsLoading(false);
    } else if (_usernameOEmail.text.isEmpty || _password.text.isEmpty) {
      await DialogBoxes().dialogBox(
          context, "Error", "Please Filled all details", DialogType.ERROR);
      setIsLoading(false);
    }
  }
}
