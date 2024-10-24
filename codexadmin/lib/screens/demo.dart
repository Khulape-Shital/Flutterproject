import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codexadmin/screens/topicsscreen.dart';
import 'package:codexadmin/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final FirebaseService _firebaseService =FirebaseService();
  final TextEditingController _courseTitleController =TextEditingController();
  final TextEditingController _courseDescController =TextEditingController();

  void _addCourse(){
    String title =_courseTitleController.text.trim();
    String description = _courseDescController.text.trim();
    if (title.isNotEmpty && description.isNotEmpty){
      
        _firebaseService.addCourse(title, description);
        Navigator.of(context).pop();

  }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("courses"),

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Courses').snapshots(), 
      
       builder:(context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          final Courses =snapshot.data!.docs;
          return ListView.builder(
            itemCount: Courses.length,
            itemBuilder: (context,index){
            var course = Courses[index];
            return ListTile(
              title: Text(course['title']),
              subtitle: Text(course['description']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicsScreen(courseId: course.id, courseTitle:course['title'])));
                },
            );
          });

        }
        return Center(child: Text("no courses available"),);
        
        })
       ,
    );
  }
}