import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/models/product_model.dart';

import '../util/toast.dart';
class ProductController{
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

// List<ProductModel> products = [
//  ProductModel(name: "Mango", color: "yellow", price: 100),
//  ProductModel(name: "Orange", color: "Orange", price: 200),
//  ProductModel(name: "Banana ", color: "yellow", price: 300),
// ];

  // function to upload products to firebase (Create operation )
  Future<void> uploadProducts(ProductModel product) async {
  //   // asset image ko   convert krnege unitBlist ke andar
  //   ByteData bytes =  await rootBundle.load(product.image);
  //  Uint8List imageData =  bytes.buffer.asUint8List(bytes.offsetInBytes,bytes.lengthInBytes);
  // final path = _storage.ref("Prodcuts/").child(product.name);// products/oragen.png
  //   await path.putData((imageData));
  //   String imageUrl = await path.getDownloadURL();
  //   product.image = imageUrl;

    // Validate product data first
    if (product.name.isEmpty ||  product.color.isEmpty) {
      Ftoast.toastMessage("Please fill all fields");
      return; // Exit the function if validation fails
    }

    try {
    final document =   _firestore.collection('Products').doc();
        product.id = document.id;
        document.set(product.toMap());
      Ftoast.toastMessage("Product uploaded successfully!");
    } catch (error) {
      Ftoast.toastMessage("Error While uploading Product: ${error.toString()}");
    }
  }

  // function to read data from firebase(Read operation )
Future<List<ProductModel>> fetchProducts() async {
    final products = await _firestore.collection("Products").get();
  List<ProductModel>allProducts =  products.docs.map((e) => ProductModel.toModel(e.data())).toList();
 return allProducts;
}


// update product
Future<void> updateProuct(String id ,Map<String ,dynamic> data) async{

   await  _firestore.collection("Products").doc(id).update(data).then((value) {
     Ftoast.toastMessage("Product Updated Sucessfully");
   },).onError((error, stackTrace) {
     Ftoast.toastMessage("Error while update product"+error.toString());
   },);
}

//delete product
Future<void> deleteProduct(String id, ) async {
    _firestore.collection("Products").doc(id).delete().then((value) {
      Ftoast.toastMessage("Product Delted Successfully");
    },).onError((error, stackTrace) {
      Ftoast.toastMessage("Error occured while deleting Product"+error.toString());
    },);
}



  }

