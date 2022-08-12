import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/widget/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_mew_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        AppRouter.NavigateToWidget(AddCategoryScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return provider.categories == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: provider.categories!.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(provider.categories![index]);
                  },
                );
        },
      ),
    );
  }
}