import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Assignment2 extends StatelessWidget {
  const Assignment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Row"),
        leading: Icon(Icons.alarm),
        actions: [Icon(Icons.food_bank)],
      ),
      body: Container(
          child: SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
      )),
    );
  }
}
