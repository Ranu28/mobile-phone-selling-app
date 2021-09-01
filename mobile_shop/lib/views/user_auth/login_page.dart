import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/providers/auth_prvider/login_provider.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/functions.dart';
import 'package:mobile_shop/views/user_auth/Signup_page.dart';
import 'package:mobile_shop/views/user_auth/components/custom_button.dart';
import 'package:mobile_shop/views/user_auth/components/text_fied.dart';
import 'package:mobile_shop/views/user_auth/components/validation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _LoginPageState extends State<LoginPage> {
  //errorText
  String? errorUsernameOrEmail;
  String? errorPassword;
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
            child: Consumer<LoginProvider>(
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
                              "Login",
                              style: TextStyle(fontSize: size.height / 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: size.width / 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont Have an account? ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                InkWell(
                                  onTap: () {
                                    UtillFunctions()
                                        .navigateRoute(context, SignUpPage());
                                  },
                                  child: Text(
                                    "Sign up ",
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
            ),
          ),
        ),
      ),
    );
  }

  Container loginMethod(Size size, LoginProvider value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputTextFiel(
            fieldName: "Username or Email",
            fieldInputType: TextInputType.text,
            controller: value.getusernameOEmail,
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
          Container(
            width: size.width,
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                UtillFunctions().navigateRoute(
                    context, FadeInDown(child: ForgotPassword()));
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          value.getIsLoading
              ? SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0,
                )
              : CustomButton(
                  size: size,
                  name: "Login",
                  onTapFunction: () async {
                    value.setIsLoading(true);
                    value.startLogin(context);

                    // // UserCredential userCredential =
                    // //     await auth.createUserWithEmailAndPassword(
                    // //         email: _usernameOEmail.text, password: _password.text);
                    // //  print(userCredential.user!.uid);
                  },
                ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Or login with,",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
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
