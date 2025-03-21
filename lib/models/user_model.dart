import 'package:flutter/cupertino.dart';

class userModel {
  String id;
  String name;
  String email;

  userModel({required this.id, required this.name, required this.email});

  //converting  productmodel  to map
  Map<String ,dynamic> toMap() {
    return {
      "Id":id,
      "Name": name,
      "Email":email,


    };
  }

  // converting product map to productModel
  factory userModel.toModel(Map<String, dynamic> map) {
    return userModel(
      id:map["Id"],
      name: map['Name'],
      email: map["Email"]


    );
  }


}
