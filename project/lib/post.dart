import 'package:flutter/material.dart';

class Post extends StatelessWidget {
   final String imgurl;
  Post({super.key, required this.imgurl});
  Widget myContainer(){
    return  Container(
          height: 150,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: Colors.black),
            image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.cover)
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        children: [
          Row(
            children: [
             
             myContainer(),
              myContainer(),
               myContainer(),
            ],
          ),
          Row(
            children: [
             
             myContainer(),
              myContainer(),
               myContainer(),
            ],
          ),
          Row(
            children: [
             
             myContainer(),
              myContainer(),
               myContainer(),
            ],
          ),
      
      
        ],
      ),
    );
  }
}