import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app_gsg/data/storage_helper.dart';
import 'package:ecommerce_app_gsg/provider/auth_provider.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              provider.selectedImage == null
                  ? InkWell(
                onTap: (){
                  provider.selectImage();
                },
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.red,
                      ),
                  )
                  : CircleAvatar(
                radius: 50,
                      backgroundImage: FileImage(provider.selectedImage!),
                    ),
              SizedBox(height: 10,),
              TextField(controller: provider.categoryNameController,),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                provider.addNewCategory();
              }, child: Text('add new category'))
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
          );
        },
      ),
    );
  }
}
