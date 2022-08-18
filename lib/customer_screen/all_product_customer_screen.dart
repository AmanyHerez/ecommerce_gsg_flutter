import 'package:ecommerce_app_gsg/customer_screen/product_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firestore_provider.dart';
class AllProductCustomerScreen extends StatelessWidget {

  String? catId;


  AllProductCustomerScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product'),),
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
                    // AppRouter.NavigateToWidget(AddProductScreen(provider.categories![index].catId));
                  },
                  child: ProductCustomerWidget(provider.products![index],catId!));
            },
          );
        },
      ),
    );
  }
}
