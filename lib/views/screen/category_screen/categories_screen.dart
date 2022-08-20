import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/screen/product_screen/add_product_screen.dart';
import 'package:ecommerce_app_gsg/views/screen/product_screen/all_product_screen.dart';
import 'package:ecommerce_app_gsg/views/screen/slider_screen/add_new_slider.dart';
import 'package:ecommerce_app_gsg/views/widget/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import 'add_mew_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Courgette-Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigateToWidget(AddCategoryScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: KorangeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<FireStoreProvider>(
          builder: (context, provider, child) {
            return provider.categories == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.categories!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          provider
                              .getAllProduct(provider.categories![index].catId);
                          AppRouter.NavigateToWidget(AllProductScreen(
                              provider.categories![index].catId));
                        },
                        child: CategoryWidget(provider.categories![index]),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

// body: Consumer<FireStoreProvider>(
// builder: (context, provider, child) {
// return provider.categories == null
// ? const Center(child: CircularProgressIndicator())
//     : GridView.builder(
// gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// ) ,
// itemCount: provider.categories!.length,
// itemBuilder: (context, index) {
// return InkWell(
// onTap: () {
// provider
//     .getAllProduct(provider.categories![index].catId);
// AppRouter.NavigateToWidget(AllProductScreen(
// provider.categories![index].catId));
// },
// child: CategoryWidget(provider.categories![index]),
// );
// },
// );
// },
// ),
