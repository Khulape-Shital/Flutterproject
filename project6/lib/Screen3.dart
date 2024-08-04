import 'package:flutter/material.dart';
import 'package:project6/Screen1.dart';
import 'package:project6/Screen2.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Screen"),
        backgroundColor: Color.fromARGB(255, 223, 18, 206),

      ),
      body: Center(
        child: Container(
          height: 200,
          width:200,
          color: Color.fromARGB(255, 161, 15, 139),
          child:  InkWell(
          onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen1()));
          }
           
        
        ),
        ),
        
        
      
      ),
      
    );
  }
}