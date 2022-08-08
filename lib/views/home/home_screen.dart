import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).SignOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<FireStoreProvider>(context, listen: false)
                .insertNewCategory();
          },
          child: Text('home page'),
        ),
      ),
    );
  }
}
