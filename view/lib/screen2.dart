import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});
  var List = ["Badal", "Rohan", "Rohit"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: List.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(9),
              child: Container(
                height: 100,
                width: 300,
                color: Colors.amber,
                child: Text(List[index]),
              ),
            );
          }),
    );
  }
}