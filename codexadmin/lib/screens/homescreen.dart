import 'package:codexadmin/screens/topicsscreen.dart';
import 'package:codexadmin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 // Add this to navigate to the Topics Screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseDescController = TextEditingController();

  void _addCourse() {
    String title = _courseTitleController.text.trim();
    String description = _courseDescController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      _firebaseService.addCourse(title, description);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            final courses = snapshot.data!.docs;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                var course = courses[index];
                return ListTile(
                  title: Text(course['title']),
                  subtitle: Text(course['description']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TopicsScreen(courseId: course.id, courseTitle: course['title']),
                      ),
                    );
                  },
                );
              },
            );
          }

          return Center(child: Text('No courses available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCourseDialog();
        },
        child: Icon(Icons.add),
        tooltip: 'Add Course',
      ),
    );
  }

  void _showAddCourseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Course'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _courseTitleController,
              decoration: InputDecoration(labelText: 'Course Title'),
            ),
            TextField(
              controller: _courseDescController,
              decoration: InputDecoration(labelText: 'Course Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _courseTitleController.clear();
              _courseDescController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _addCourse,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
