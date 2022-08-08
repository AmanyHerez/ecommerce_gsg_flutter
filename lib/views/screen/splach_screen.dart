import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);
navigatorFun(BuildContext context)async{
  await Future.delayed(Duration(seconds: 3));
  Provider.of<AuthProvider>(context,listen: false).checkUser();

}
  @override
  Widget build(BuildContext context) {
    navigatorFun(context);
    return Scaffold(
      body: Center(child: Text('Splach Screen')),
    );
  }
}
