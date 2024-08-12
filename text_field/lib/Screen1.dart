import 'package:flutter/material.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Instagram",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w400),),
      actions: [
        Row(
          children: [
            Icon(Icons.favorite_outline_outlined),
            Icon(Icons.message_outlined)
          ],
        )
      ],),
      

    );
  }
}