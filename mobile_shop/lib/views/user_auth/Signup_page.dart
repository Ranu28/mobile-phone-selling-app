import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/providers/auth_prvider/reg_provider.dart';
import 'package:mobile_shop/utils/colors.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/dialog_boxes.dart';
import 'package:mobile_shop/utils/functions.dart';
import 'package:mobile_shop/views/user_auth/components/custom_button.dart';
import 'package:mobile_shop/views/user_auth/components/social_media_button.dart';
import 'package:mobile_shop/views/user_auth/components/text_fied.dart';
import 'package:mobile_shop/views/user_auth/components/validation.dart';
import 'package:mobile_shop/views/user_auth/login_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPage createState() => _SignUpPage();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _SignUpPage extends State<SignUpPage> {
  //errorText
  String? errorUserName;
  String? errorEmail;
  String? errorPassword;
  String? errorCounty;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgoundThem,
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: size.height / 6),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<RegistrationProvider>(
              builder: (context, value, child) {
                return Column(
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
                              "Sign Up",
                              style: TextStyle(fontSize: size.height / 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: size.width / 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already Have an account? ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                InkWell(
                                  onTap: () {
                                    UtillFunctions()
                                        .navigateRoute(context, LoginPage());
                                  },
                                  child: Text(
                                    "Sign in ",
                                    style:
                                        TextStyle(color: Colors.grey.shade700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    loginMethod(size, value),
                  ],
                );
              },
            )),
      ),
    );
  }

  Container loginMethod(Size size, RegistrationProvider value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputTextFiel(
            fieldName: "Email",
            fieldInputType: TextInputType.emailAddress,
            controller: value.getEmail,
            errorTxt: errorEmail,
            onchange: (String value) {
              int validateValue = userNameoEmail(value);
              String? stateSet = errorTextUsernameOrEmail(validateValue);

              setState(() {
                errorEmail = stateSet;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomInputTextFiel(
            fieldName: "User Name",
            fieldInputType: TextInputType.text,
            controller: value.getUsernameOrEmail,
            errorTxt: errorUserName,
            onchange: (String value) {
              int validateValue = userNameoEmail(value);
              String? stateSet = errorTextUsernameOrEmail(validateValue);

              setState(() {
                errorUserName = stateSet;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomInputTextFiel(
            isObsecure: true,
            fieldName: "Password",
            fieldInputType: TextInputType.text,
            controller: value.getPassword,
            errorTxt: errorPassword,
            onchange: (String value) {
              int validateValue = userNameoEmail(value);
              String? stateSet = errorPasswod(validateValue);

              setState(() {
                errorPassword = stateSet;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomInputTextFiel(
            fieldName: "Country",
            fieldInputType: TextInputType.text,
            controller: value.getCountry,
            errorTxt: errorCounty,
            onchange: (String value) {
              int validateValue = userNameoEmail(value);
              String? stateSet = errorCountry(validateValue);

              setState(() {
                errorCounty = stateSet;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              size: size,
              name: "Sign Up",
              onTapFunction: () async {
                //   SignUpController()
                //       .signUp(_Email.toString(), _password.toString());
                // },
                if (errorUserName != null ||
                    errorEmail != null ||
                    errorPassword != null ||
                    errorCounty != null) {
                  DialogBoxes().dialogBox(
                      context,
                      "Error",
                      "Filled all details with valid details",
                      DialogType.ERROR);
                } else {
                  value.regButton(context);
                }
              }),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   "Or signup with,",
          //   style: TextStyle(color: Colors.grey),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     SocialMedia(
          //       size: size,
          //       urlImage:
          //           'https://image.flaticon.com/icons/png/512/174/174848.png',
          //     ),
          //     SocialMedia(
          //       size: size,
          //       urlImage:
          //           'https://image.flaticon.com/icons/png/512/733/733579.png',
          //     ),
          //     SocialMedia(
          //       size: size,
          //       urlImage:
          //           'https://image.flaticon.com/icons/png/512/281/281764.png',
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
