import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new course to Firestore
  Future<void> addCourse(String title, String description) async {
    try {
      await _firestore.collection('Courses').add({
        'title': title,
        'description': description,
      });
      print("Course added successfully");
    } catch (e) {
      print("Failed to add course: $e");
    }
  }

  /// Add a new topic to a course
  Future<void> addTopic(String courseId, String title, String description) async {
    try {
      await _firestore.collection('Courses').doc(courseId).collection('Topics').add({
        'title': title,
        'description': description,
      });
      print("Topic added successfully");
    } catch (e) {
      print("Failed to add topic: $e");
    }
  }

  /// Add a new code to a topic
  Future<void> addCode(String courseId, String topicId, String code, String description) async {
    try {
      await _firestore.collection('Courses').doc(courseId).collection('Topics')
          .doc(topicId).collection('Codes').add({
        'code': code,
        'description': description,
      });
      print("Code added successfully");
    } catch (e) {
      print("Failed to add code: $e");
    }
  }
}
