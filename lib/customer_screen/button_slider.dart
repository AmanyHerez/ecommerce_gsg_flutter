import 'dart:developer';

import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ButtonSlider extends StatelessWidget {
  const ButtonSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return Center(
            child: ElevatedButton(onPressed: (){
              log(provider.getAllSlider().toString());
            },child: Text('get slider')),
          );
        },

      ),
    );
  }
}
