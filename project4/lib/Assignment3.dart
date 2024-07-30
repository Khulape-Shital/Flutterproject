import 'package:flutter/material.dart';

class Assignment3 extends StatelessWidget {
  const Assignment3({super.key});

  Widget myContainer(){
    return   Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
                height:200,
                width: 150,
                  color: Colors.black,        
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5mtLCK5wr8H7Q_iDSkbZ1_wjV98ku7hKaPw&s",fit: BoxFit.cover,)
                
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("container Image"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              myContainer(),
              myContainer(),
              myContainer(),
              myContainer(),
              myContainer(),
              myContainer(),
              myContainer(),
            ],
          ),
        ),
      ),
    );
  }
}