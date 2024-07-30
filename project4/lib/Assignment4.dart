import 'package:flutter/material.dart';

class Assignment4 extends StatelessWidget {
  final String imgurl;
  const Assignment4({super.key,required this.imgurl});

    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: Colors.black,
        height: 250,
        width: 150,
        child: Image.network(imgurl),
      ),
    );
    
  }
}