import 'package:flutter/material.dart';

class Assignment11 extends StatelessWidget {
  const Assignment11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Box Deecoretion"),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                // boxShadow: [
                //   // BoxShadow(
                //   //   blurRadius: 5,
                //   //   blurStyle: BlurStyle.normal,
                //   //   color: Colors.black,
                //   //   spreadRadius: 20,
                //   // )
                // ],
                border: Border.all(color: Colors.red, width: 5)),
          ),
        ));
  }
}
