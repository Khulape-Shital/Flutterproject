import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Category{

    final String id;
    final String name;

   Category({required this.id,required this.name});
   factory Category.fromSnapshot(DocumentSnapshot snapshot) {

  return Category(id: snapshot.id, name: snapshot['name']);
}
Map<String,dynamic> toJson(){
  return{
    'name' : name,
  };
}
}

