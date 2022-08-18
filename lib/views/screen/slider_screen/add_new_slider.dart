import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore_provider.dart';
class AddNewSlider extends StatelessWidget {
  const AddNewSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Slider')),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 90,
                vertical: 100,
              ),
              child: Column(

                children: [
                  provider.selectedImage == null
                      ? InkWell(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.add,color: Colors.black87,size: 50,),
                    ),
                  )
                      : CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(provider.selectedImage!),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      provider.addNewSlider();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'add new slider',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
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
    );;
  }
}
