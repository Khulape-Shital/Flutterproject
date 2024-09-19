import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project17/email.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading =true;
  List data = [];

  Future<void> fetchData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    debugPrint("before data");
    var response = await http.get(url);
    debugPrint("data ${response.statusCode}");
    setState(() {
      loading =false;
      data =json.decode(response.body);
    });
  }
@override
void initState(){
  debugPrint("init state called");
  fetchData();
}
  @override
  Widget build(BuildContext context) {
    debugPrint("build method called");
    debugPrint("$data");

    return Scaffold(
      appBar: AppBar(
        title: Text("fatched data"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(31, 68, 67, 67),
      ),
      body: loading ?Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return Container(
            margin:EdgeInsets.all(20),
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 150, 197, 238),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(82, 0, 0, 0)
              )
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Email(mail: data[index])));
              },
                    
              title: Center(child: Text("Name:${data[index]["name"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
            ),
          );
      
        
      }),
    );
  }
}