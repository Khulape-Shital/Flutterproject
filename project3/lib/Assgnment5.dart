import 'package:flutter/material.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: Text("Row scrolable"),
        ),
        body: Center(
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
        ));
  }
}
