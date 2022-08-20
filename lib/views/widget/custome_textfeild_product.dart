import 'package:flutter/material.dart';

import '../../constants/constants.dart';
class CustomeTextFeildProductWidget extends StatelessWidget {
  TextEditingController controller;
   String title;

  CustomeTextFeildProductWidget({required this.controller,required this.title});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: KlightgreeyColor,
          fontFamily: 'Courgette-Regular',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
