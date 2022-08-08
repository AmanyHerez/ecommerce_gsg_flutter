import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:flutter/material.dart';
class CustomeDialog{
static  showDialogFunction(String content){
    showDialog(context: AppRouter.navKey.currentContext!, builder:(context){

      return AlertDialog(
        content: Text(content),
        actions: [TextButton(onPressed: (){
          AppRouter.popRoute();
        }, child: Text('ok'))],
      );
    });
  }
}