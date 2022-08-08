import 'package:ecommerce_app_gsg/data/fireStore_helper.dart';
import 'package:flutter/material.dart';

class FireStoreProvider extends ChangeNotifier{
  insertNewCategory(){
    FireStoreHelper.fireStoreHelper.insertDummyDataInFireStore();
  }
}