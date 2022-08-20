import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../screen/category_screen/categories_screen.dart';
import '../screen/slider_screen/all_slider_admin_screen.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Commerce',
          style: TextStyle(
            fontFamily: 'Courgette-Regular',
            color: Colors.black87,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).SignOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                AppRouter.NavigateToWidget(AllSliderAdminScreen());
              },
              child: Container(
                height: 300,
                child: Center(
                    child: Text(
                  'Sliders',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette-Regular',
                  ),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Colors.orange.shade200,
                      Colors.orange.shade300,
                      Colors.orange.shade400,
                      Colors.orange.shade500,
                    ])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                AppRouter.NavigateToWidget(CategoriesScreen());
              },
              child: Container(
                height: 300,
                child: Center(
                    child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette-Regular',
                  ),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Colors.orange.shade200,
                      Colors.orange.shade300,
                      Colors.orange.shade400,
                      Colors.orange.shade500,
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
