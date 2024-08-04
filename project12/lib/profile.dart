import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imgurl;
  const Profile({super.key,required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
          height: 200,
          width: 200,
          child: Image.network(imgurl),
        ),
      ),
        
       
    );
  }
}