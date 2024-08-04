import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {

  final String imgurl;
  const Assignment1({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: Colors.orange,
       
        child: Image.network(imgurl),
      ),
    );
  }
}