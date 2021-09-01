import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/controller/auth_controller.dart';
import 'package:mobile_shop/utils/dialog_boxes.dart';

class RegistrationProvider extends ChangeNotifier {
  bool _isLoading = false;
  //controller
  final _UserName = TextEditingController();
  final _Email = TextEditingController();
  final _password = TextEditingController();
  final _country = TextEditingController();

//getters
  bool get getLoade => _isLoading;
  TextEditingController get getUsernameOrEmail => _UserName;
  TextEditingController get getEmail => _Email;
  TextEditingController get getPassword => _password;
  TextEditingController get getCountry => _country;

  Future<void> regButton(BuildContext context) async {
    if (_Email.text.isEmpty ||
        _UserName.text.isEmpty ||
        _password.text.isEmpty ||
        _country.text.isEmpty) {
      DialogBoxes().dialogBox(
          context, "Error", "Please Filled all details", DialogType.ERROR);
    } else {
      // UserCredential userCredential =
      //     await auth.createUserWithEmailAndPassword(
      //         email: _Email.text, password: _password.text);
      // print(userCredential.user!.uid);

      await AuthController(context).registerUser(
          _Email.text, _password.text, _UserName.text, _country.text);
    }
  }
}
