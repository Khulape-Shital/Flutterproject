import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new course to Firestore without an image
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
  /// Update an existing course
  Future<void> updateCourse(String courseId, String title, String description) async {
    try {
      await _firestore.collection('Courses').doc(courseId).update({
        'title': title,
        'description': description,
      });
      print("Course updated successfully");
    } catch (e) {
      print("Failed to update course: $e");
    }
  }

  /// Delete a course
  Future<void> deleteCourse(String courseId) async {
    try {
      await _firestore.collection('Courses').doc(courseId).delete();
      print("Course deleted successfully");
    } catch (e) {
      print("Failed to delete course: $e");
    }
  }

  /// Add a new course with an image URL
  Future<void> addCourseWithImage(String title, String description, String imageUrl) async {
    try {
      await _firestore.collection('Courses').add({
        'title': title,
        'description': description,
        'imageURL': imageUrl, // Store the image URL in Firestore
        'createdAt': DateTime.now(),
      });
      print("Course with image added successfully");
    } catch (e) {
      print("Failed to add course with image: $e");
    }
  }

  /// Add a new topic to a course
  Future<void> addTopic(String courseId, String title, String description) async {
    try {
      await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('Topics')
          .add({
        'title': title,
        'description': description,
      });
      print("Topic added successfully");
    } catch (e) {
      print("Failed to add topic: $e");
    }
  }
  Future<void>updateTopics(String courseId,String title,String description,String topicId) async{
    try{
      await _firestore.collection('Courses').doc(courseId).collection('Topics').doc(topicId).update({'title':title,'description':description});
      print("topic update  Succesfully");
    }catch(e){
      print("faild to update: $e ");
    }
  }
 Future<void> deleteTopics(String courseId, String topicId) async {
  try {
    await _firestore.collection('Courses').doc(courseId).collection('Topics').doc(topicId).delete();
    print("Topic deleted successfully");
  } catch (e) {
    print("Failed to delete topic: $e");
  }
}


  /// Add a new code to a topic
  
  Future<void> addCode(String courseId, String topicId, String code, String description) async {
  await FirebaseFirestore.instance
      .collection("Courses")
      .doc(courseId)
      .collection("Topics")
      .doc(topicId)
      .collection("Codes")
      .add({
        'code': code,
        'description': description,
     
      });
}
Future<void> updateCode(String courseId,String topicId,String codeId,String Code ,String description) async{
  try{
    await _firestore.collection('courses').doc(courseId).collection('topics').doc(topicId).collection('code').doc(codeId).update({'code':Code,'description':description});
   print("code update  Succesfully");
    }catch(e){
      print("faild to update: $e ");
    }

}

Future<void> deleteCode(String courseId,String topicId,String codeId,String code, String description)async{
  try{
    await _firestore.collection('courses').doc(courseId).collection('topics').doc(topicId).collection('code').doc(codeId).delete();

  }
  catch (e){
    
  }
}

  // Optional: Test Firestore connection
  Future<void> testAddToFirestore() async {
    try {
      await _firestore.collection('TestCollection').add({
        'testField': 'testValue',
      });
      print("Test entry added to Firestore successfully");
    } catch (e) {
      print("Firestore connection error: $e");
    }
  }
}