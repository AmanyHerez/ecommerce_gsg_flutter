import 'package:ecommerce_app_gsg/views/auth/screen/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../constants/constants.dart';
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(

                        child: Image.asset("asset/image/logo.png",width: 220,height: 200,fit: BoxFit.cover,),

                      ),
                    ),
                    Text(
                      'Create a new account',
                      style: TextStyle(
                        color: KblackColor,
                          fontFamily: 'Courgette-Regular',
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'please put your information below to create a new account for using app',
                      style: TextStyle(
                        fontFamily: 'Courgette-Regular',
                        color: KBoldgreeyColor,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20,),
                    CustomTextfield(
                      title: 'Full Name',
                      validator: provider.nullValidation,
                      controller: provider.fullNameController,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      title: 'Email',
                      validator: provider.emailValidation,
                      controller: provider.emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      title: 'password',
                      validator: provider.passwordValidation,
                      controller: provider.passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.SignUp();
                        },

                        style: ElevatedButton.styleFrom(
                          primary: KorangeColor,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Register Now',style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Courgette-Regular',
                            fontSize: 18,
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Courgette-Regular',
                        ),),
                        InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(SignInScreen());
                          },
                          child: Text('Sign in',style: TextStyle(
                            color: KorangeColor,
                            fontFamily: 'Courgette-Regular',
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
