import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getapi4 extends StatefulWidget {
  const Getapi4({super.key});

  @override
  State<Getapi4> createState() => _Getapi4State();
}

class _Getapi4State extends State<Getapi4> {
  List data =[];
  bool loading =true;

  Future<void> fetchData() async {
    var url =Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response =await http.get(url);
    debugPrint("${response.statusCode}");
    if(response.statusCode ==200){
      setState(() {
        loading =false;
        data = jsonDecode(response.body);
      });
    }

  }
  @override
  void initState(){
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("$data");
    return Scaffold(
      body:  Container(
        height: 100,
        width: 100,
        color: Colors.purple,
      ),
    );
  }
}