import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text("Column"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 50,
              color: Colors.pink,
            ),
            Text("text"),
            Container(
              height: 50,
              width: 50,
              color: Colors.pink,
            ),
            Text("text"),
            Container(
              height: 50,
              width: 50,
              color: Colors.pink,
            ),
            Text("text"),
            Container(
              height: 50,
              width: 50,
              color: Colors.pink,
            ),
            Text("text"),
            Container(
              height: 50,
              width: 50,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
