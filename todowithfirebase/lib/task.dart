import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  final  String id;
  final String categoryId;
  final String title;
  final bool isCompleted;

  Task({
    required this.id,required this.categoryId,
   this.isCompleted=false,required this.title
  });
  factory Task.fromSnapshot(DocumentSnapshot snapshot){
    return Task(id: snapshot.id, categoryId: snapshot['categoryId'], title:snapshot['title'],isCompleted: snapshot['iscompleted']?? false);
  }
  Map<String,dynamic>toJson(){
    return{
      'categoryId':categoryId,
      'title':title,
      'iscompleted':isCompleted
    };
  }

}