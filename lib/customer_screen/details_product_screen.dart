import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detailsProduct_Widget.dart';
class DetailsProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Product',style: TextStyle(color: Colors.black87,fontFamily: 'Courgette-Regular',),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount:provider.products!.length ,
              itemBuilder: (context, index) {
            return DetailsProductWidget(provider.products![index]);
          });
        },

      ),
    );
  }
}
