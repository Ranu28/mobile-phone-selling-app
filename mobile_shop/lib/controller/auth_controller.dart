import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:mobile_shop/controller/db_controller.dart';
import 'package:mobile_shop/utils/dialog_boxes.dart';
import 'package:mobile_shop/utils/functions.dart';
import 'package:mobile_shop/views/home_screen/home_screen.dart';

class AuthController {
  BuildContext context;
  AuthController(this.context);
  //fiebase auth instance
  FirebaseAuth auth = FirebaseAuth.instance;
  var logger = Logger();

  //function to register a user

  Future<void> registerUser(String email, password, userName, country) async {
    UserCredential userCredential;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await DatabaseController().saveUserData(
          userName, email, password, country, userCredential.user!.uid);
      //     .whenComplete(() async {
// await DatabaseController().saveUserData(
//             userName, email, password, country);
      // });
      DialogBoxes()
          .dialogBox(context, "Success", "user registered", DialogType.SUCCES);

      print(userCredential.user!.uid);
      logger.i(userCredential.user!.uid);

      if (userCredential.user!.uid != null) {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBoxes().dialogBox(context, "error",
            'The password provided is too weak.', DialogType.ERROR);

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DialogBoxes().dialogBox(context, "error",
            'The account already exists for that email', DialogType.ERROR);

        print('The account already exists for that email.');
      }
    } catch (e) {
      DialogBoxes().dialogBox(context, "error", e.toString(), DialogType.ERROR);
      logger.e('Wrong password provided for that user.');

      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        UtillFunctions.pushRemoveNavigation(context, HomeScreen());
        // UtillFunctions()
        //     .navigateRoute(context, FadeInDown(child: HomeScreen()));
      }
      print(userCredential.user!.uid);
      logger.i(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBoxes().dialogBox(context, "error",
            'No user found for that email.', DialogType.ERROR);
        logger.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        DialogBoxes().dialogBox(context, "error",
            'Wrong password provided for that user.', DialogType.ERROR);
        logger.e('Wrong password provided for that user.');
      }
    }
  }

  Future<void>? sendResetEmail(String email) {
    // auth.sendPasswordResetEmail(email: email);

    try {
      auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      DialogBoxes().dialogBox(context, "error", e.toString(), DialogType.ERROR);
      logger.e(e.toString());
    }
  }
}
