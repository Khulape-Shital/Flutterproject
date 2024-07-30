import 'package:flutter/material.dart';

class Assignment2 extends StatelessWidget {
  const Assignment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("container Image"),
      ),
      body: Center(
        child: Container(
          height:400,
          width: 300,

          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5mtLCK5wr8H7Q_iDSkbZ1_wjV98ku7hKaPw&s",fit: BoxFit.cover,),
          
        ),
      ),
    );
  }
}