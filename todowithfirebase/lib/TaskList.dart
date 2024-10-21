import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todowithfirebase/task.dart';

class Tasklist extends StatelessWidget {
  final String categoryName;
  final String categoryId;
  const Tasklist(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final CollectionReference tasksRef =
        FirebaseFirestore.instance.collection('task');
    return Scaffold(
      appBar: AppBar(
        title: Text('categoryName'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              tasksRef.where('categoryId', isEqualTo: categoryId).snapshots(),
          builder:(context, snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator(),);
              }
             final List<Task> tasks =snapshot.data!.docs.map((doc)=>Task.fromSnapshot(doc)).toList();
             return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context,inex){
              final task = tasks[inex];
              return ListTile(title: Text(task.title),
              onLongPress: ()async{},);
             });
              
          },),
          floatingActionButton: FloatingActionButton(onPressed: () {
          _showBottomSheet(context,tasksRef);

          },
          child: const Icon(Icons.add),),
    );
    
  
  }
  void  _showBottomSheet(BuildContext,CollectionReference tasksRef){
      final TextEditingController controller =TextEditingController();

      showModalBottomSheet(context: context, builder: (BuildContext context){
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: ' entertask title'),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {}, child: const Text('Add Task')
              )
            ],
          ),
        );
      }
      );
    }
}
