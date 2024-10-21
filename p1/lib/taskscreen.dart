
import 'package:p1/Tasks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TaskList extends StatelessWidget {
   final String categoryName;
  final String categoryId;

  TaskList({required this.categoryId ,  required this.categoryName,});

  @override
  Widget build(BuildContext context) {

    // created "Tasks" collection on firestore
    final CollectionReference tasksRef =
        FirebaseFirestore.instance.collection('tasks');

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksRef.where('categoryId', isEqualTo: categoryId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // converted firestore tasks colection data to our model class
          final List<Task> tasks =
              snapshot.data!.docs.map((doc) => Task.fromSnapshot(doc)).toList();

          return Container(
             decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20210224/pngtree-blue-abstract-background-business-image_564246.jpg"),fit: BoxFit.cover)),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (newValue) async {
                      await tasksRef.doc(task.id).update({
                        'isCompleted': newValue,
                      });
                    },
                  ),
                  onLongPress: () async {
                    await tasksRef.doc(task.id).delete();
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context, tasksRef);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, CollectionReference tasksRef) {
    final TextEditingController _controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
           height: 200,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/046/605/934/small/sky-with-a-beautiful-sunset-a-blue-and-orange-sky-with-soft-clouds-a-sky-background-photo.jpg"),fit: BoxFit.cover)),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter Task',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String taskTitle = _controller.text.trim();
                  if (taskTitle.isNotEmpty) {
                    await tasksRef.add({
                      'categoryId': categoryId,
                      'title': taskTitle,
                      'isCompleted': false,   
                      'timestamp': FieldValue
                          .serverTimestamp(), // Add the timestamp field
                    });

                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
              ),
            ],
          ),
        );
      },
    );
  }
}
