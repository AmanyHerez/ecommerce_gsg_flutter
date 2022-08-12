import 'dart:io';

import 'package:ecommerce_app_gsg/data/fireStore_helper.dart';
import 'package:ecommerce_app_gsg/data/storage_helper.dart';
import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FireStoreProvider extends ChangeNotifier {
  FireStoreProvider(){
    getAllCategories();
  }
  TextEditingController categoryNameController = TextEditingController();
  File? selectedImage;
  List<Category>? categories=[];
 selectImage()async{
   XFile? xFile= await ImagePicker().pickImage(source: ImageSource.gallery);
   selectedImage=File(xFile!.path);
   notifyListeners();
 }
  addNewCategory() async {
    if (selectedImage != null) {
     String imageUrl=await StorageHelper.storageHelper.uploadImage(selectedImage!);
     Category category=Category( name: categoryNameController.text, imageUrl: imageUrl);
     Category newCategory=await  FireStoreHelper.fireStoreHelper.addNewCategory(category);
     selectedImage=null;
     categories!.add(newCategory);

    }
  }
getAllCategories()async{
  categories=await FireStoreHelper.fireStoreHelper.getAllCategories();
  notifyListeners();

}
updateCategory(Category category)async{
   String? imageUrl;
   if(selectedImage!=null){
     imageUrl=await StorageHelper.storageHelper.uploadImage(selectedImage!);
   }
   Category newCategory=Category(name: categoryNameController.text, imageUrl: imageUrl?? category.imageUrl);
newCategory.catId=category.catId;
   await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
getAllCategories();
 }

deleteCategory(Category category)async{
  await FireStoreHelper.fireStoreHelper.deleteCategory(category);
  getAllCategories();
}
// insertNewCategory(){
//   FireStoreHelper.fireStoreHelper.insertDummyDataInFireStore();
// }

}
