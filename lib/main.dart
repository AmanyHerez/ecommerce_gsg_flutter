import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/auth/screen/sign_in_screen.dart';
import 'package:ecommerce_app_gsg/views/screen/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
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
        ChangeNotifierProvider<AuthProvider>(create: (context)=>AuthProvider(),),
        ChangeNotifierProvider<FireStoreProvider>(create: (context)=>FireStoreProvider(),),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        //key: AppRouter.navKey,
        home: SplachScreen(),
      ),
    );
  }
}

