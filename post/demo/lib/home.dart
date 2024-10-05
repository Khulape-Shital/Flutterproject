import 'package:demo/dummydata/javascriptList.dart';
import 'package:demo/dummydata/javatopics.dart';
import 'package:demo/topics.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Codex"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             InkWell(
              onTap: (){
                debugPrint("java lis $javaTopics");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Topics(javaTopics:javaTopics ,)));
              },
               child: Container(
                color: Colors.red,
                height: 200,
                width: 200,
                child: Center(child: Text("java")),
               ),
             ),
             InkWell(
              onTap: (){
                debugPrint("Js list $javascriptTopics");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Topics(javaTopics:javascriptTopics ,)));
              },
               child: Container(
                color: const Color.fromARGB(255, 136, 244, 54),
                height: 200,
                width: 200,
                child: Center(child: Text("js")),
               
               ),
             )
          ],
        ),
      ),
    );
  }
}