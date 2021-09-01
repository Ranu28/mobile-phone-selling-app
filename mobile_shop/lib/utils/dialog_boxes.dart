import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class DialogBoxes {
  Future<dynamic> dialogBox(
      BuildContext context, String title, String desc, DialogType dalogType) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: dalogType,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }
}
