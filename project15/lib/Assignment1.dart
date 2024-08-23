import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        backgroundColor: Colors.amber,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    width: 100,
                    margin: EdgeInsets.all(10),
                    color: Colors.amber,
                  );
                }),
            ),
        
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
              shrinkWrap: true,
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.red,
                    height: 300,
                    margin: EdgeInsets.only(bottom: 10),
                  );
                
              }),
            )
          ],
        ),
      ),
    );
  }
}