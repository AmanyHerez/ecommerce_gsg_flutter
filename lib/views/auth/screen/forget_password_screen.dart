import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/views/widget/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, AuthProvider provider, child) {
          return Column(
            children: [
              Text('اعادة تعين كلمة المرور'),
              CustomTextfield(
                title: 'email address',
                validator: provider.emailValidation,
                controller: provider.emailController,
                textInputType: TextInputType.emailAddress,
              ),
              MaterialButton(onPressed: (){
                provider.forgetPassword();
              },child: Text('اعادة تغير كلمة المرور'),)
            ],
          );
        },
      ),
    );
  }
}
