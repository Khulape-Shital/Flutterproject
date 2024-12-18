import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Getapi extends StatefulWidget {
  const Getapi({super.key});

  @override
  State<Getapi> createState() => _GetapiState();
}

class _GetapiState extends State<Getapi> {

  bool loading  = true;
  List data =[];
    Future<void> fetchData() async {
    var url =Uri.parse("https://api.api-ninjas.com/v1/weather?city=London");
    var headers = <String,String> {
      'x-api-key': 'D7YpVRLAQp44HQFtxYXFNg==EHlxn9Srm1yy2sSn',
      'Content-Type': 'application/json',  // Optional, adjust if needed
    };

    var response = await http.get(url, headers:headers);

   debugPrint("data${response.statusCode}");
   if(response.statusCode ==200){
    setState(() {
      loading =false;
      data =json.decode(response.body);
    });
   }
  }
  @override
  void initState(){
    debugPrint("init state called");
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("$data");
    return Scaffold(
      body: Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 160, 205, 242),
              borderRadius: BorderRadius.all(Radius.circular(20),
              ),
            ),
          ),
        );
      }),

      ),
    );
  }
}