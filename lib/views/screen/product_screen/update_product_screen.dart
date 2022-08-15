import 'package:ecommerce_app_gsg/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore_provider.dart';
import '../../widget/custome_textfeild_product.dart';
class UpdateProductScreen extends StatelessWidget {
 Product product;
 String catId;


 UpdateProductScreen(this.product,this.catId);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('update product'),),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 80,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  provider.selectedImage == null
                      ? InkWell(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(product.image!),
                    ),
                  )
                      : CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(provider.selectedImage!),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomeTextFeildProductWidget(title: 'enter your name product',controller: provider.productNameController),
                  SizedBox(height: 10,),
                  CustomeTextFeildProductWidget(title: 'enter your description',controller: provider.productdescriptionController),
                  SizedBox(height: 10,),
                  CustomeTextFeildProductWidget(title: 'enter your price',controller: provider.productpriceController),
                  SizedBox(height: 10,),
                  CustomeTextFeildProductWidget(title: 'enter your quantity',controller: provider.productquantityController),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.updateProduct(product, catId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'update Product',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ))
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Provider.of<FireStoreProvider>(context, listen: false)
                  //       //     .insertNewCategory();
                  //     },
                  //     child: Text('home page'),
                  //   ),
                  // ),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //      XFile? xfile=await ImagePicker().pickImage(source: ImageSource.gallery);
                  //      String url=await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
                  //      log(url);
                  //     },
                  //     child: Text('upload image'),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
