import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile_shop/controller/auth_controller.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/dialog_boxes.dart';
import 'package:mobile_shop/views/user_auth/components/custom_button.dart';
import 'package:mobile_shop/views/user_auth/components/text_fied.dart';
import 'package:mobile_shop/views/user_auth/components/validation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _ForgotPasswordState extends State<ForgotPassword> {
  //controller
  final _usernameOEmail = TextEditingController();
  bool isLoading = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //errorText
  String? errorUsernameOrEmail;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: FadeInRightBig(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: size.height / 6),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    '${Constants.Image_PATH}dimuthupng.png',
                    width: size.width / 1.8,
                    height: size.height / 6,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: size.height / 20),
                        ),
                      ),
                    ],
                  ),
                ),
                loginMethod(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container loginMethod(Size size) {
    return Container(
      padding: EdgeInsets.only(top: size.height / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputTextFiel(
            fieldName: "Username or Email",
            fieldInputType: TextInputType.text,
            controller: _usernameOEmail,
            errorTxt: errorUsernameOrEmail,
            onchange: (String value) {
              int validateValue = userNameoEmail(value);
              String? stateSet = errorTextUsernameOrEmail(validateValue);

              setState(() {
                errorUsernameOrEmail = stateSet;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          isLoading
              ? SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0,
                )
              : CustomButton(
                  size: size,
                  name: "Send Reset Email",
                  onTapFunction: () async {
                    if (_usernameOEmail.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      // await auth.sendPasswordResetEmail(
                      //     email: _usernameOEmail.text);
                      // Logger().i("Email Sent");
                      await AuthController(context)
                          .sendResetEmail(_usernameOEmail.text);
                      setState(() {
                        isLoading = false;
                      });
                    } else if (_usernameOEmail.text.isEmpty) {
                      DialogBoxes().dialogBox(context, "Error",
                          "Please enter email", DialogType.ERROR);
                    }
                  }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
