import 'package:flutter/material.dart';

class Assignment6 extends StatelessWidget {
  const Assignment6({super.key});

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
            color: const Color.fromARGB(255, 153, 221, 230),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.cyan,
                    margin: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 23, 9, 141),
                    margin: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 113, 12, 144),
                    margin: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Color.fromARGB(255, 212, 138, 0),
                    margin: EdgeInsets.only(left: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
