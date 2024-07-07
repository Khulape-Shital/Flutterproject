import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Row"),
        leading: Icon(Icons.alarm),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 216, 23, 23),
          ),
          Container(
            height: 100,
            width: 100,
            color: Color.fromARGB(255, 23, 216, 52),
          )
        ],
      ),
    );
  }
}
