import 'package:ecommerce_app_gsg/views/screen/product_screen/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
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
        title: Text('All products', style: TextStyle(
          color: Colors.black87,
          fontFamily: 'Courgette-Regular',
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: Colors.black87) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         AppRouter.NavigateToWidget(AddProductScreen(catId));
        },
        backgroundColor: KorangeColor,
        child: Icon(Icons.add,size: 30,),
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
