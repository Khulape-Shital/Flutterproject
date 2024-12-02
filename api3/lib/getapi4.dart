import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_cors/' // Import the flutter_cors package
class Getapi4 extends StatefulWidget {
  const Getapi4({super.key});

  @override
  State<Getapi4> createState() => _Getapi4State();
}

class _Getapi4State extends State<Getapi4> {
  Map data ={};
  bool loading =true;

  Future<void> fetchData() async {
    var url =Uri.parse("GET https://api.stormglass.io/v2/weather/point?lat=15.2993&lng=74.1240&params=waveHeight,windSpeed");
    

    var response = await http.get(url);
  
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
        color: const Color.fromARGB(255, 142, 138, 143),
      ),
    );
  }
}