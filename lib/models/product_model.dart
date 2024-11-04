import 'package:flutter/material.dart';

class ProductModel{
  String id;
 String name;
 String color;
 String price;

 ProductModel({
   required this.id,
   required this.name,
   required this.color,
   required this.price,
});
 //converting  productmodel  to map
Map<String ,dynamic> toMap() {
  return {
    "Id":id,
    "Name": name,
    "Color": color,
    "Price": price,
  };
}
  // converting product map to productModel
 factory ProductModel.toModel(Map<String, dynamic> map) {
   return ProductModel(
     id:map["Id"],
     name: map['Name'],
     color: map['Color'],
     price: map['Price'],
   );
 }


}