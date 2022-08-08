import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../router/router.dart';
import '../../widget/custome_textfield.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
//صفحة انشاء حساب
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.signUpKey,
            child: Column(
              children: [

                Text('تسجيل مستخدم جديد'),
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

                      provider.SignUp();
                    },
                    child: Text('تسجيل جديد'),
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
