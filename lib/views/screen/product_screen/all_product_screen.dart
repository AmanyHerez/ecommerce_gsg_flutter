import 'package:ecommerce_app_gsg/views/screen/product_screen/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore_provider.dart';
import '../../../router/router.dart';
import 'add_product_screen.dart';
class AllProductScreen extends StatelessWidget {
  String? catId;


  AllProductScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         AppRouter.NavigateToWidget(AddProductScreen(catId));
        },
        child: Icon(Icons.add),
      ),
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
                  child: ProductWidget(provider.products![index],catId!));
            },
          );
        },
      ),
    );
  }
}
