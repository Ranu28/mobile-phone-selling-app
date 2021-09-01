import 'package:flutter/material.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/functions.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobile_shop/views/user_auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 5), () {
      UtillFunctions.pushRemoveNavigation(context, LoginPage());
      // Navigator.push(
      //     // context, MaterialPageRoute(builder: (context) => HomeScreen()));
      //     context,
      //     MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              child: Container(
                child: Image.asset(
                  '${Constants.Image_PATH}dimuthupng.png',
                  width: size.width / 1.8,
                  height: size.height / 6,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
