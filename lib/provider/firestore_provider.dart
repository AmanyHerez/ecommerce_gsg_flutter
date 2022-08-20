import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app_gsg/data/fireStore_helper.dart';
import 'package:ecommerce_app_gsg/data/storage_helper.dart';
import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:ecommerce_app_gsg/models/product.dart';
import 'package:ecommerce_app_gsg/models/slider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FireStoreProvider extends ChangeNotifier {
  FireStoreProvider() {
    getAllCategories();
    getAllSlider();
  }

  TextEditingController categoryNameController = TextEditingController();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productdescriptionController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productquantityController = TextEditingController();

  File? selectedImage;
  List<Category>? categories = [];
  List<Product>? products = [];
  List<SliderModel>? sliders = [];

  selectImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xFile!.path);
    notifyListeners();
  }

  addNewCategory() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Category category =
          Category(name: categoryNameController.text, imageUrl: imageUrl);
      Category newCategory =
          await FireStoreHelper.fireStoreHelper.addNewCategory(category);
      selectedImage = null;
      categories!.add(newCategory);
    }
  }

  getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelper.getAllCategories();
    notifyListeners();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Category newCategory = Category(
        name: categoryNameController.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newCategory.catId = category.catId;
    await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
    getAllCategories();
  }

  deleteCategory(Category category) async {
    await FireStoreHelper.fireStoreHelper.deleteCategory(category);
    getAllCategories();
  }

  getAllProduct(String? catId) async {
    products = await FireStoreHelper.fireStoreHelper.getAllProduct(catId!);
    notifyListeners();
  }

  addNewProduct(String catId) async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Product product = Product(
        name: productNameController.text,
        description: productdescriptionController.text,
        image: imageUrl,
        price: num.parse(productpriceController.text),
        quantity: int.parse(productquantityController.text),
      );
   Product newProduct=   await FireStoreHelper.fireStoreHelper.addNewProduct(product, catId);
    selectedImage=null;
    products?.add(newProduct);
    }
  }

  updateProduct(Product product,String catId) async {
    String? imageUrl;
    if(selectedImage!=null){
      imageUrl=await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Product newProduct=Product(
      name: productNameController.text,
      description: productdescriptionController.text,
      image: imageUrl?? product.image,
      price: num.parse(productpriceController.text),
      quantity: int.parse(productquantityController.text),
    );
    newProduct.id=product.id;
    await FireStoreHelper.fireStoreHelper.updateProduct(newProduct, catId);
    getAllProduct(catId);
  }

  deleteProduct(Product product,String catId) async {
    await FireStoreHelper.fireStoreHelper.deleteProduct(product, catId);
    getAllProduct(catId);
  }
  addNewSlider() async {
    if (selectedImage != null) {
      String imageUrl =
      await StorageHelper.storageHelper.uploadImage(selectedImage!);
      SliderModel sliderModel =
      SliderModel(imageUrl: imageUrl);
      SliderModel newSlider =
      await FireStoreHelper.fireStoreHelper.addNewSlider(sliderModel);
      selectedImage = null;
      sliders!.add(newSlider);
    }
  }
  getAllSlider() async {
    sliders = await FireStoreHelper.fireStoreHelper.getAllSlider();
    notifyListeners();
    log(sliders.toString());
  }
  updateSlider(SliderModel slider) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    SliderModel newSlider = SliderModel(imageUrl: imageUrl ?? slider.imageUrl);

    newSlider.id = slider.id;
    await FireStoreHelper.fireStoreHelper.updateSlider(slider);
    getAllSlider();
  }

  deleteSlider(SliderModel slider) async {
    await FireStoreHelper.fireStoreHelper.deleteSlider(slider);
    getAllSlider();
  }

// insertNewCategory(){
//   FireStoreHelper.fireStoreHelper.insertDummyDataInFireStore();
// }

}
