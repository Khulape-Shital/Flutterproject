import 'package:flutter/material.dart';
import 'package:project6/Screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Screen Rowtting"),
        backgroundColor: const Color.fromARGB(255, 169, 21, 21),

      ),

      body: Center(
        child: InkWell(
          onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2()));
          }
           
        
        ),
      ),
    );
  }
}