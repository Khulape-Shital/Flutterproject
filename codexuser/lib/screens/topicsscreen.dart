import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Topicsscreen extends StatefulWidget {
  final String? courseId;
  final String? courseName;
  const Topicsscreen({super.key, this.courseId, this.courseName});

  @override
  State<Topicsscreen> createState() => _TopicsscreenState();
}

class _TopicsscreenState extends State<Topicsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.courseName}"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Courses")
                .doc(widget.courseId)
                .collection("Topics")
                .snapshots(),
            builder: (context , snapshot){
              var topics = snapshot.data!.docs;
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  var singleTopic = topics[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 300,
                      color: const Color.fromARGB(255, 239, 200, 200),
                      child: Center(child: Text(singleTopic['description'])),
                    ),
                  );
              });
            }));
  }
}
