import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/firestore_provider.dart';

class UpdateCategoryScreen extends StatelessWidget {
  Category category;

  UpdateCategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update category'),
      ),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 100,
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
                            radius: 100,
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(category.imageUrl!),
                          ),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(provider.selectedImage!),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: provider.categoryNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.updateCategory(category);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'update category',
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
