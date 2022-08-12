import 'package:ecommerce_app_gsg/data/authHelper.dart';
import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/auth/screen/sign_up_screen.dart';
import 'package:ecommerce_app_gsg/views/widget/custome_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.Keylogin,
            child: Column(
              children: [
                Text('تسجيل الدخول'),
                CustomTextfield(
                  title: 'email address',
                  validator: provider.emailValidation,
                  controller: provider.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextfield(
                  title: 'password',
                  validator: provider.passwordValidation,
                  controller: provider.passwordController,
                  textInputType: TextInputType.visiblePassword,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      //AuthHelper.authHelper.signUp('AmanyHerez2000@gmail.com', '123456');
                      provider.SignIn();
                    },
                    child: Text('تسجيل الدخول'),
                  ),
                ),


              ],
            ),
          );
        }),
      ),
    );
  }
}
