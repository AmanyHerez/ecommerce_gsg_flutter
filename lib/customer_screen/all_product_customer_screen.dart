import 'dart:ui';

import 'package:ecommerce_app_gsg/customer_screen/product_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firestore_provider.dart';
import '../router/router.dart';
import 'details_product_screen.dart';
class AllProductCustomerScreen extends StatelessWidget {

  String? catId;


  AllProductCustomerScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product',style: TextStyle(color: Colors.black87),),centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        elevation: 0,

        backgroundColor: Colors.transparent,),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return provider.products == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: provider.products!.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    //AddProductScreen(provider.categories![index].catId
                     AppRouter.NavigateToWidget(DetailsProductScreen());
                  },
                  child: ProductCustomerWidget(provider.products![index],catId!));
            },
          );
        },
      ),
    );
  }
}
