import 'package:flutter/material.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ROW ASSIGNMENT 5",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 9, 65, 233),
      ),
      body: Container(
        color: Color.fromARGB(255, 250, 198, 215),
        child: Center(
          child: Container(
            height: 500,
            width: 900,
            color: Colors.red,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFFFFFFF),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFFFFFFF),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
