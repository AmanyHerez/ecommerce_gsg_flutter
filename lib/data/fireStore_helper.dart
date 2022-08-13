import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:ecommerce_app_gsg/models/product.dart';
import 'package:flutter/cupertino.dart';

import '../models.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  CollectionReference<Map<String, dynamic>> categoriesCollectionReferance =
      FirebaseFirestore.instance.collection("categories");

  Future<Category> addNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await categoriesCollectionReferance.add(category.toMap());
    category.catId = documentReference.id;
    return category;
  }

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollectionReferance.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      //رح تجيب الماب اللا جوا
      Category category = Category.fromMap(e.data());

      category.catId = e.id;
      return category;
    }).toList();

    return categories;
  }

  deleteCategory(Category category) async {
    await categoriesCollectionReferance.doc(category.catId).delete();
  }

  updateCategory(Category category) async {
    await categoriesCollectionReferance
        .doc(category.catId)
        .update(category.toMap());
  }

  addNewProduct(Product product, String catId) async {
    DocumentReference<Map<String, dynamic>> documentReference= await FirebaseFirestore.instance
        .collection('categories')
        .doc(catId)
        .collection('products')
        .add(product.toMap());
    product.id=documentReference.id;
    return product;
  }

  Future<List<Product>> getAllProduct(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot=await FirebaseFirestore.instance.collection('categories').doc(catId).collection('products').get();
    List<Product> products= querySnapshot.docs.map((e) {
      Product product=Product.FromMap(e.data());
      product.id=e.id;
      return product;
    }).toList();
    return products;
  }

  updateProduct(Product product, String catId) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }

  deleteProduct(Product product, String catId) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .delete();
  }

// insertDummyDataInFireStore()async{
//   FirestoreInstance.collection(categoreyCollelctionName).add({"nameAr":"طعام","nameAr":"طعام","nameEn":"food","imageUrl":"http://image.jpg",});
// }

//CollectionReference<Map<String,dynamic>> userCollection= FirebaseFirestore.instance.collection('users');
//
// addUserToFireStore(AppUser appUser)async{
//   userCollection.doc(appUser.id).set(appUser.toMap());
// }
// Future<AppUser> getUserFromFireStore(String id)async{
//   DocumentSnapshot<Map<String, dynamic>>  documentSnapShot=await userCollection.doc(id).get();
//  return AppUser.FromMap(documentSnapShot.data()!);
//    //Map<String,dynamic>? dataMap=documentSnapShot.data();
// }
}
