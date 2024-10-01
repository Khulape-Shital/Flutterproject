import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
} 

class _Screen1State extends State<Screen1> {
  bool loading = true;
  List data =[];
  Future<void>dataFeating()async{
    var url =Uri.parse("https://jsonplaceholder.typicode.com/todos");
    debugPrint("before data");
    var response= await http.get(url);
    debugPrint("data${response.statusCode}");
    setState(() {
      loading =false;
      data =json.decode(response.body);
    });}
    @override
    void initState(){
      debugPrint("init state called");
      dataFeating();
    
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("build method called");
    debugPrint("$data");
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        centerTitle: true,

        
        backgroundColor: Colors.grey,
        
      ),
      body: loading? Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(20),
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 225, 77, 220),
              border: Border.all(width: 3,color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
                
      })
    );
  }
}