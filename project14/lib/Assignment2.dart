import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  bool boxColor =true;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 224, 37, 99),
      ),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
          Container(
            height: 400,
            width: 400,
            color: boxColor?Colors.green:Colors.red,
          ),
          FloatingActionButton(onPressed: (){
             if(boxColor){
      boxColor =false;

    }
    else{
      boxColor =true;
    }
    setState(() {
      
    });
          },tooltip: 'increment',
          backgroundColor: boxColor?Colors.red:Colors.green,)
         ],
        ),
      ),
    );
  }
}