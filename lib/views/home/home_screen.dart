import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app_gsg/data/storage_helper.dart';
import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:ecommerce_app_gsg/views/home/carusal_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../customer_screen/all_category_customer_screen.dart';
import '../../customer_screen/catgory_widget.dart';
import '../../customer_screen/popular_product_customer_widget.dart';

class HomeScreen extends StatelessWidget {

  // String? catId;
  //
  // HomeScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce",style: TextStyle(color: Colors.black87),),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).SignOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical:10),
        child: Consumer<FireStoreProvider>(
          builder: (context, provider, child) {
             return ListView(
               children: [
                 CarouselWithIndicator(
                     data: provider.sliders! ),
                 SizedBox(height: 10,),
                 Row(
                   children: [
                     Text(
                       'Categories',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         fontFamily: 'Courgette-Regular',
                       ),
                     ),

                     // Spacer(),
                     // TextButton(
                     //   onPressed: () {
                     //     AppRouter.NavigateToWidget(AllCategoryCustomerScreen());
                     //   },
                     //   child: Text(
                     //     "View All",
                     //     style: TextStyle(
                     //       fontWeight: FontWeight.bold,
                     //       fontSize: 18,
                     //       color: Colors.orange,
                     //       decoration: TextDecoration.underline,
                     //     ),
                     //   ),
                     // ),
                   ],
                 ),
                 SizedBox(height: 10,),
                 AllCategoryCustomerScreen(),
                 // SizedBox(
                 //   height: 115,
                 //   child: ListView.builder(
                 //     itemCount: provider.categories!.length,
                 //     shrinkWrap: true,
                 //     scrollDirection: Axis.horizontal,
                 //     itemBuilder: (context, index) {
                 //       return CategoryCustomeWidget(
                 //         provider.categories![index],
                 //       );
                 //     },
                 //   ),
                 // ),
                 // Text(
                 //   'Popular Products',
                 //   style: TextStyle(
                 //     fontWeight: FontWeight.bold,
                 //     fontSize: 20,
                 //   ),
                 // ),
                 // SizedBox(
                 //   height: 170,
                 //   child: ListView.builder(
                 //     itemCount: provider.products!.length,
                 //     shrinkWrap: true,
                 //     scrollDirection: Axis.horizontal,
                 //     itemBuilder: (context, index) {
                 //       return PopularProductCustomerWidget(
                 //           provider.products![index],
                 //       );
                 //     },
                 //   ),
                 // ),
               ],
             );



            //   Column(
            //   children: [
            //     provider.selectedImage == null
            //         ? InkWell(
            //       onTap: (){
            //         provider.selectImage();
            //       },
            //           child: CircleAvatar(
            //               radius: 50,
            //               backgroundColor: Colors.red,
            //             ),
            //         )
            //         : CircleAvatar(
            //       radius: 50,
            //             backgroundImage: FileImage(provider.selectedImage!),
            //           ),
            //     SizedBox(height: 10,),
            //     TextField(controller: provider.categoryNameController,),
            //     SizedBox(height: 10,),
            //     ElevatedButton(onPressed: (){
            //       provider.addNewCategory();
            //     }, child: Text('add new category'))
            //     // Center(
            //     //   child: ElevatedButton(
            //     //     onPressed: () {
            //     //       // Provider.of<FireStoreProvider>(context, listen: false)
            //     //       //     .insertNewCategory();
            //     //     },
            //     //     child: Text('home page'),
            //     //   ),
            //     // ),
            //     // Center(
            //     //   child: ElevatedButton(
            //     //     onPressed: () async {
            //     //      XFile? xfile=await ImagePicker().pickImage(source: ImageSource.gallery);
            //     //      String url=await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
            //     //      log(url);
            //     //     },
            //     //     child: Text('upload image'),
            //     //   ),
            //     // ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
