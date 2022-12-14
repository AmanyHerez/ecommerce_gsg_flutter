import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firestore_provider.dart';

import '../router/router.dart';
import '../views/screen/product_screen/all_product_screen.dart';
import 'all_category_customer_widget.dart';
import 'all_product_customer_screen.dart';
class AllCategoryCustomerScreen extends StatelessWidget {
  const AllCategoryCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(title: Text('all categorise'),),
      // body:
      Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return provider.categories == null
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
            scrollDirection:Axis.vertical ,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 400/500,
            ) ,
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.categories!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  provider
                      .getAllProduct(provider.categories![index].catId);
                  AppRouter.NavigateToWidget(AllProductCustomerScreen(
                      provider.categories![index].catId));
                },
                child: AllCategoryCustomerWidget(provider.categories![index]),

              );
            },
          );
        },
      //),
    );
  }
}

//
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