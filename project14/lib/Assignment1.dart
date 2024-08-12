import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
bool boxColor =true;
  void changeColor(){
    if(boxColor){
      boxColor =false;

    }
    else{
      boxColor =true;
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("Build method callod");
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
          FloatingActionButton(onPressed: changeColor,tooltip: 'increment',
          backgroundColor: boxColor?Colors.red:Colors.green,)
         ],
        ),
      ),
    );
  }
}