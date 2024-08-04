import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String imgurl;
  const MyContainer({super.key,required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Image.network(imgurl,fit: BoxFit.cover,),
      padding: EdgeInsets.all(20),
      
    );
    
  }
}