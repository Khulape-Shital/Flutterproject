import 'package:flutter/material.dart';

class Assignment8 extends StatelessWidget {
  const Assignment8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Box scroll"),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Container(
            height: 400,
            width: 400,
            color: const Color.fromARGB(255, 178, 156, 216),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.cyan,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 23, 9, 141),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 113, 12, 144),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 183, 225, 56),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 122, 84, 12),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 26, 173, 38),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 0, 212, 25),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 212, 39, 0),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 81, 212, 0),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 8, 186, 202),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 0, 0, 0),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 53, 212, 0),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
