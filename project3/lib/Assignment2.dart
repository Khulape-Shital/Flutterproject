import 'package:flutter/material.dart';

class Assignment2 extends StatelessWidget {
  const Assignment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Row /column"),
        backgroundColor: const Color.fromARGB(255, 183, 94, 124),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black26,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
