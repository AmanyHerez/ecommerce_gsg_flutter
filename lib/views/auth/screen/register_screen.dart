import 'package:ecommerce_app_gsg/views/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../router/router.dart';
import '../../widget/custome_textfield.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
//صفحة انشاء حساب
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.registerKey,
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
                CustomTextfield(
                  title: 'user name',
                  validator: provider.nullValidation,
                  controller: provider.usernameController,
                  textInputType: TextInputType.text
                  ,
                ),CustomTextfield(
                  title: 'phone',
                  validator: provider.phoneValidation,
                  controller: provider.phoneController,
                  textInputType: TextInputType.phone,
                ),


                Center(
                  child: ElevatedButton(
                    onPressed: () {

                      provider.SignUp();
                      AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
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
