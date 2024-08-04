import 'package:flutter/material.dart';
import 'package:project6/Screen1.dart';
import 'package:project6/Screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Screen"),
        backgroundColor: Color.fromARGB(255, 36, 242, 214),

      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child:  InkWell(
          onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen3()));
          }
           
        
        ),
        ),
        
        
      
      ),
      
    );
  }
}