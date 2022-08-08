import 'package:ecommerce_app_gsg/data/authHelper.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../views/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return "صيغة الايميل خاطئة";
    }
  }

  passwordValidation(String value) {
    if (value.length < 6) {
      return ' يجب ان تكون كلمة السر 6 حروف على الاقل';
    }
  }
  checkUser(){
    AuthHelper.authHelper.checkUser();
  }

  SignIn() async {
    if (loginKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signIn(emailController.text, passwordController.text);
      if (credential != null) {
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
      }

    }
  }
  SignUp() async {
    if (signUpKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signUp(emailController.text, passwordController.text);
      if (credential != null) {
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
      }

    }
  }
  forgetPassword(){
//AuthHelper.authHelper.forgetPassword('AmanyHerez2000@gmail.com');
    AuthHelper.authHelper.forgetPassword(emailController.text.trim());
  }
  SignOut(){
    AuthHelper.authHelper.signOut();
  }
}
