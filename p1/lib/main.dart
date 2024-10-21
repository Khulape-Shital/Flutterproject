import 'package:p1/Home.dart';
import 'package:p1/Sign.dart';
import 'package:p1/Tasks.dart';
import 'package:p1/category.dart';
import 'package:p1/firebase_options.dart';
import 'package:p1/categoryscreen.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p1/categoryscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Example',
      home: Home(),
    );
  }
}



