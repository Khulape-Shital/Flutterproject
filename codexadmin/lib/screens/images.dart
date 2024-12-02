import 'dart:io';
import 'package:codexadmin/screens/topicsscreen.dart';
import 'package:codexadmin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeImage extends StatefulWidget {
  @override
  _HomeImageState createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseDescController = TextEditingController();
  File? _image; // Image file

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImageAndAddCourse() async {
    String title = _courseTitleController.text.trim();
    String description = _courseDescController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty && _image != null) {
      // Upload image to Firebase Storage
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('courses/${DateTime.now().millisecondsSinceEpoch}.jpg');

        await storageRef.putFile(_image!);

        // Get download URL
        String downloadURL = await storageRef.getDownloadURL();

        // Save course data to Firestore
        _firebaseService.addCourseWithImage(title, description, downloadURL);

        Navigator.of(context).pop();
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to upload image.')));
      }
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
                  leading: course['imageURL'] != null
                      ? Image.network(course['imageURL'], width: 50, height: 50)
                      : Icon(Icons.image),
                  title: Text(course['title']),
                  subtitle: Text(course['description']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicsScreen(
                          courseId: course.id,
                          courseTitle: course['title'],
                        ),
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 10),
            _image != null
                ? Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : const Text('No image selected.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _courseTitleController.clear();
              _courseDescController.clear();
              setState(() {
                _image = null; // Clear the image
              });
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _uploadImageAndAddCourse,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
