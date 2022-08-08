import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper{
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper=  FireStoreHelper._();
  FirebaseFirestore FirestoreInstance= FirebaseFirestore.instance;
  final String categoreyCollelctionName='categories';
  insertDummyDataInFireStore()async{
    FirestoreInstance.collection(categoreyCollelctionName).add({"nameAr":"طعام","nameAr":"طعام","nameEn":"food","imageUrl":"http://image.jpg",});
  }
}