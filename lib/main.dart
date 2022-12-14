import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/auth/screen/sign_in_screen.dart';
import 'package:ecommerce_app_gsg/views/auth/screen/sign_up_screen.dart';
import 'package:ecommerce_app_gsg/views/home/home_screen.dart';
import 'package:ecommerce_app_gsg/views/home/carusal_slider_widget.dart';
import 'package:ecommerce_app_gsg/views/screen/category_screen/categories_screen.dart';
import 'package:ecommerce_app_gsg/views/screen/slider_screen/add_new_slider.dart';
import 'package:ecommerce_app_gsg/views/screen/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_screen/all_category_customer_screen.dart';
import 'customer_screen/button_slider.dart';
import 'customer_screen/details_product_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<FireStoreProvider>(
          create: (context) => FireStoreProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navKey,
        //key: AppRouter.navKey,
      //home: SplachScreen(),
//home:ButtonSlider(),
   home: HomeScreen(),
      ),
    );
  }
}
