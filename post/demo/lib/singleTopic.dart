import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final Map? topic;
  const Topic({super.key,this.topic});

  @override
  Widget build(BuildContext context) {
    debugPrint("single topic $topic");
    return Scaffold(
      appBar: AppBar(
        title: Text("${topic!["topicName"]}"),
      ),
      body: ListView.builder(
        itemCount: topic!["topicCodes"].length,
        itemBuilder: (context,index){
        return ListTile(
            title: Text("${topic!["topicCodes"][index]}"),
        );
      }),
    );
  }
}