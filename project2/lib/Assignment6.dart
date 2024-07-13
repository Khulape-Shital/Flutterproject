import 'package:flutter/material.dart';

class Assignment6 extends StatelessWidget {
  const Assignment6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ROW ASSIGNMENT 6",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 9, 65, 233),
      ),
      body: Container(
        color: Color.fromARGB(255, 242, 203, 216),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              width: 450,
              color: const Color.fromARGB(255, 231, 23, 8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 100,
                      color: Color(0xFFFFFFFF),
                    ),
                    Container(
                      height: 80,
                      width: 100,
                      color: Color(0xFFFFFFFF),
                    ),
                    Container(
                      height: 80,
                      width: 100,
                      color: Color(0xFFFFFFFF),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: 450,
                color: const Color.fromARGB(255, 230, 20, 5),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 100,
                        color: Color(0xFFFFFFFF),
                      ),
                      Container(
                        height: 80,
                        width: 100,
                        color: Color(0xFFFFFFFF),
                      ),
                      Container(
                        height: 80,
                        width: 100,
                        color: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
