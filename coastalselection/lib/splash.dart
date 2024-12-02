
import 'package:coastalselection/homescreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: 200,
        color: Colors.amber,
        child: InkWell(
          onTap:(){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(beach: beaches,)));
          },
        ),
      ),
    );
  }
}