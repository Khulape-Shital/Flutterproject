import 'package:demo/singleTopic.dart';
import 'package:flutter/material.dart';

class Topics extends StatelessWidget {
  final List? javaTopics;
  const Topics({super.key ,this.javaTopics});

  @override
  Widget build(BuildContext context) {
    debugPrint("data sent successfully $javaTopics");
    return Scaffold(
      appBar: AppBar(
        title: Text("topics"),
      ),
      body: ListView.builder(
        itemCount: javaTopics!.length,
        itemBuilder: (context,index){
          return ListTile(
              title: Text("${javaTopics![index]["topicName"]}"),
              onTap: (){
                debugPrint("${javaTopics![index]}");
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Topic(topic: javaTopics![index],)));
              },
          );
      }),
    );
  }
}