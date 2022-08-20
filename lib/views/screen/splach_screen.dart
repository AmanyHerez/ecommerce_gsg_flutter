import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  navigatorFun(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AuthProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    navigatorFun(context);
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Container(
            child: Image.asset(
              "asset/image/bg.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            // decoration: BoxDecoration(
            //     color: Colors.red,
            //     image: DecorationImage(
            //       image: AssetImage("asset/image/bg.png"),
            //     )),
          ),
          Positioned(
            left: 50,
            bottom: 460,
            child: Text(
              ' Grocery',
              style: TextStyle(
                fontSize: 51,
                color:KorangeColor,
              ),
            ),
          ),
          Positioned(
            bottom: 420,
            left: 150,
            child: Text('  Store',
              style: TextStyle(
                fontSize: 45,
              ),),
          ),
        ])
      ],
    ));
  }
}
