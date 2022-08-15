import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore_provider.dart';
import '../../widget/custome_textfeild_product.dart';
class AddProductScreen extends StatelessWidget {
 String? catId;
 AddProductScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 80,
              ),
              child: Column(
                children: [
                  provider.selectedImage == null
                      ? InkWell(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.add,color: Colors.black87,size: 50,),
                    ),
                  )
                      : CircleAvatar(
                    radius: 80,
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
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.addNewProduct(catId!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'add new Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
